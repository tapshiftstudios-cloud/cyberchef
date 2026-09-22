-- Fiş tarama geliştirmeleri: mağaza, güven, tüketim zamanı
alter table public.pantry_items
  add column if not exists store_name text,
  add column if not exists confidence real,
  add column if not exists consumed_at timestamptz;

create index if not exists pantry_items_user_expiry_idx
  on public.pantry_items (user_id, is_consumed, purchase_date desc);
