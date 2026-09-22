create table if not exists public.pro_purchase_events (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  source text not null,
  product_id text not null,
  purchase_id text,
  created_at timestamptz not null default now()
);

create unique index if not exists pro_purchase_events_unique_purchase
  on public.pro_purchase_events (source, purchase_id)
  where purchase_id is not null;

alter table public.pro_purchase_events enable row level security;

drop policy if exists "Users read own pro purchase events" on public.pro_purchase_events;
create policy "Users read own pro purchase events"
  on public.pro_purchase_events
  for select
  using (auth.uid() = user_id);

drop policy if exists "service_role_full_access_pro_purchase_events" on public.pro_purchase_events;
create policy "service_role_full_access_pro_purchase_events"
  on public.pro_purchase_events
  for all
  to service_role
  using (true)
  with check (true);
