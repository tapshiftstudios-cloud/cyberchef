-- CyberChef: pantry scan history
-- Run in Supabase SQL Editor (Dashboard → SQL → New query)

create table if not exists public.pantry_scans (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  mode text not null check (mode in ('quickScan', 'survival', 'chefMode')),
  ingredients jsonb not null default '[]'::jsonb,
  recipes jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists pantry_scans_user_created_idx
  on public.pantry_scans (user_id, created_at desc);

alter table public.pantry_scans enable row level security;

create policy "Users read own pantry scans"
  on public.pantry_scans
  for select
  using (auth.uid() = user_id);

create policy "Users insert own pantry scans"
  on public.pantry_scans
  for insert
  with check (auth.uid() = user_id);

create policy "Users delete own pantry scans"
  on public.pantry_scans
  for delete
  using (auth.uid() = user_id);
