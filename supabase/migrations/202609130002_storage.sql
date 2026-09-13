-- Storage buckets. Run after initial schema.
insert into storage.buckets (id, name, public)
values
  ('vocab-images','vocab-images',false),
  ('japanese-audio','japanese-audio',false),
  ('generated-audio','generated-audio',false),
  ('speaking-recordings','speaking-recordings',false),
  ('imports','imports',false)
on conflict (id) do nothing;

-- Owner path convention: <user_id>/...
create policy "owner read objects" on storage.objects
for select to authenticated
using ((storage.foldername(name))[1] = (select auth.uid())::text);

create policy "owner insert objects" on storage.objects
for insert to authenticated
with check ((storage.foldername(name))[1] = (select auth.uid())::text);

create policy "owner update objects" on storage.objects
for update to authenticated
using ((storage.foldername(name))[1] = (select auth.uid())::text)
with check ((storage.foldername(name))[1] = (select auth.uid())::text);

create policy "owner delete objects" on storage.objects
for delete to authenticated
using ((storage.foldername(name))[1] = (select auth.uid())::text);
