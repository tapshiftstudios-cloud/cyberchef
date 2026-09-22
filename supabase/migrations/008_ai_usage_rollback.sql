-- Roll back one AI usage slot when the upstream model call fails after guard_ai_usage consumed it.
create or replace function public.rollback_ai_usage(
  p_actor_id text,
  p_action text
)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_today date := (now() at time zone 'utc')::date;
begin
  if p_actor_id is null or length(trim(p_actor_id)) = 0 then
    return;
  end if;

  update public.ai_usage_guard
  set
    count = greatest(count - 1, 0),
    updated_at = now()
  where usage_date = v_today
    and actor_id = p_actor_id
    and action = p_action
    and count > 0;
end;
$$;
