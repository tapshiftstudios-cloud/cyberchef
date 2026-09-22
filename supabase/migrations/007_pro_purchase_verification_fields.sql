alter table public.pro_purchase_events
  add column if not exists platform text,
  add column if not exists package_name text,
  add column if not exists verification_status text,
  add column if not exists verified_at timestamptz,
  add column if not exists provider_response jsonb;
