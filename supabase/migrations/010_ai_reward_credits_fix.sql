create or replace function public.grant_ai_reward_credit(
  p_actor_id text,
  p_action text,
  p_max_daily_earned integer default 3
)
returns table(
  granted boolean,
  reason text,
  credits_remaining integer
)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_today date := (now() at time zone 'utc')::date;
  v_earned integer := 0;
  v_remaining integer := 0;
begin
  if p_actor_id is null or length(trim(p_actor_id)) = 0 then
    return query select false, 'invalid_actor'::text, 0;
    return;
  end if;

  insert into public.ai_reward_credits (
    usage_date, actor_id, action, credits_remaining, credits_earned_today, updated_at
  )
  values (v_today, p_actor_id, p_action, 0, 0, now())
  on conflict (usage_date, actor_id, action) do nothing;

  select r.credits_earned_today, r.credits_remaining
    into v_earned, v_remaining
  from public.ai_reward_credits r
  where r.usage_date = v_today
    and r.actor_id = p_actor_id
    and r.action = p_action
  for update;

  if v_earned >= p_max_daily_earned then
    return query select false, 'max_earned_today'::text, v_remaining;
    return;
  end if;

  update public.ai_reward_credits r
  set
    credits_remaining = r.credits_remaining + 1,
    credits_earned_today = r.credits_earned_today + 1,
    updated_at = now()
  where r.usage_date = v_today
    and r.actor_id = p_actor_id
    and r.action = p_action
  returning r.credits_remaining into v_remaining;

  return query select true, 'ok'::text, v_remaining;
end;
$$;

create or replace function public.guard_ai_usage(
  p_actor_id text,
  p_action text,
  p_daily_limit integer,
  p_cooldown_seconds integer,
  p_use_reward_credit boolean default false
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
  v_reward_remaining integer := 0;
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
    if p_use_reward_credit then
      insert into public.ai_reward_credits (
        usage_date, actor_id, action, credits_remaining, credits_earned_today, updated_at
      )
      values (v_today, p_actor_id, p_action, 0, 0, now())
      on conflict (usage_date, actor_id, action) do nothing;

      select r.credits_remaining
        into v_reward_remaining
      from public.ai_reward_credits r
      where r.usage_date = v_today
        and r.actor_id = p_actor_id
        and r.action = p_action
      for update;

      if v_reward_remaining > 0 then
        update public.ai_reward_credits r
        set
          credits_remaining = r.credits_remaining - 1,
          updated_at = now()
        where r.usage_date = v_today
          and r.actor_id = p_actor_id
          and r.action = p_action;

        update public.ai_usage_guard g
        set
          count = g.count + 1,
          last_used_at = now(),
          updated_at = now()
        where g.usage_date = v_today
          and g.actor_id = p_actor_id
          and g.action = p_action;

        return query select true, 'reward_credit'::text, 0, 0;
        return;
      end if;
    end if;

    return query select false, 'daily_limit'::text, 0, 0;
    return;
  end if;

  update public.ai_usage_guard g
  set
    count = g.count + 1,
    last_used_at = now(),
    updated_at = now()
  where g.usage_date = v_today
    and g.actor_id = p_actor_id
    and g.action = p_action;

  return query select true, 'ok'::text, 0, greatest(p_daily_limit - (v_count + 1), 0);
end;
$$;
