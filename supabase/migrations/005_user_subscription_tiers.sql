create table if not exists public.user_subscription_tiers (
  user_id uuid primary key references auth.users(id) on delete cascade,
  tier text not null default 'free' check (tier in ('free', 'pro')),
  updated_at timestamptz not null default now()
);

alter table public.user_subscription_tiers enable row level security;

drop policy if exists "Users read own subscription tier" on public.user_subscription_tiers;
create policy "Users read own subscription tier"
  on public.user_subscription_tiers
  for select
  using (auth.uid() = user_id);

drop policy if exists "service_role_full_access_subscription_tiers" on public.user_subscription_tiers;
create policy "service_role_full_access_subscription_tiers"
  on public.user_subscription_tiers
  for all
  to service_role
  using (true)
  with check (true);
