insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'legal',
  'legal',
  true,
  1048576,
  array['text/html', 'text/plain', 'application/pdf']
)
on conflict (id) do update set public = true;

drop policy if exists "public_read_legal" on storage.objects;
create policy "public_read_legal"
  on storage.objects for select
  to public
  using (bucket_id = 'legal');

drop policy if exists "service_role_manage_legal" on storage.objects;
create policy "service_role_manage_legal"
  on storage.objects for all
  to service_role
  using (bucket_id = 'legal')
  with check (bucket_id = 'legal');
