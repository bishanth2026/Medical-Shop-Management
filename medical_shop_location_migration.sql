-- Apply after the Medical Shop Phase 2 foundation migration.
-- Enables batch-level physical storage locations and secure staff updates.
alter table public.stock_batches add column if not exists rack_number text;
alter table public.stock_batches add column if not exists shelf_number text;
alter table public.stock_batches add column if not exists bin_location text;
create index if not exists stock_batches_rack_idx on public.stock_batches(pharmacy_id, rack_number, shelf_number);

drop policy if exists "authorized staff update stock locations" on public.stock_batches;
create policy "authorized staff update stock locations" on public.stock_batches
for update to authenticated
using (public.has_pharmacy_role(pharmacy_id,array['owner','admin','pharmacist']))
with check (public.has_pharmacy_role(pharmacy_id,array['owner','admin','pharmacist']));
