-- Receipt / freshness tracking items (fiş tarama)
create table if not exists public.pantry_items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  clean_name text not null,
  category text not null,
  purchase_date timestamptz not null default now(),
  estimated_expiry_days integer not null check (estimated_expiry_days > 0),
  is_consumed boolean not null default false,
  raw_name text,
  quantity text,
  created_at timestamptz not null default now()
);

create index if not exists pantry_items_user_created_idx
  on public.pantry_items (user_id, created_at desc);

alter table public.pantry_items enable row level security;

create policy "Users read own pantry items"
  on public.pantry_items for select
  using (auth.uid() = user_id);

create policy "Users insert own pantry items"
  on public.pantry_items for insert
  with check (auth.uid() = user_id);

create policy "Users update own pantry items"
  on public.pantry_items for update
  using (auth.uid() = user_id);

create policy "Users delete own pantry items"
  on public.pantry_items for delete
  using (auth.uid() = user_id);
