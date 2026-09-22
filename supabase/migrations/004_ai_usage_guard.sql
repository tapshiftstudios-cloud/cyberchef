create table if not exists public.ai_usage_guard (
  usage_date date not null,
  actor_id text not null,
  action text not null,
  count integer not null default 0,
  last_used_at timestamptz,
  updated_at timestamptz not null default now(),
  primary key (usage_date, actor_id, action)
);

alter table public.ai_usage_guard enable row level security;

drop policy if exists "service_role_full_access_ai_usage_guard" on public.ai_usage_guard;
create policy "service_role_full_access_ai_usage_guard"
  on public.ai_usage_guard
  for all
  to service_role
  using (true)
  with check (true);

create or replace function public.guard_ai_usage(
  p_actor_id text,
  p_action text,
  p_daily_limit integer,
  p_cooldown_seconds integer
)
returns table(
  allowed boolean,
  reason text,
  wait_seconds integer,
  remaining integer
)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_today date := (now() at time zone 'utc')::date;
  v_count integer := 0;
  v_last_used timestamptz;
  v_wait integer := 0;
begin
  if p_actor_id is null or length(trim(p_actor_id)) = 0 then
    return query select false, 'invalid_actor'::text, 0, 0;
    return;
  end if;

  insert into public.ai_usage_guard (usage_date, actor_id, action, count, last_used_at, updated_at)
  values (v_today, p_actor_id, p_action, 0, null, now())
  on conflict (usage_date, actor_id, action) do nothing;

  select g.count, g.last_used_at
    into v_count, v_last_used
  from public.ai_usage_guard g
  where g.usage_date = v_today
    and g.actor_id = p_actor_id
    and g.action = p_action
  for update;

  if v_last_used is not null and p_cooldown_seconds > 0 then
    v_wait := p_cooldown_seconds - floor(extract(epoch from (now() - v_last_used)))::integer;
    if v_wait > 0 then
      return query select false, 'cooldown'::text, v_wait, greatest(p_daily_limit - v_count, 0);
      return;
    end if;
  end if;

  if v_count >= p_daily_limit then
    return query select false, 'daily_limit'::text, 0, 0;
    return;
  end if;

  update public.ai_usage_guard
  set
    count = count + 1,
    last_used_at = now(),
    updated_at = now()
  where usage_date = v_today
    and actor_id = p_actor_id
    and action = p_action;

  return query select true, 'ok'::text, 0, greatest(p_daily_limit - (v_count + 1), 0);
end;
$$;
