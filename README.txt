Medical Shop ERP - physical rack/shelf location enhancement

Files:
- index.html: updated cloud-connected frontend
- medical_shop_location_migration.sql: run once in Supabase SQL Editor AFTER the Phase 2 foundation migration.

Enhancements:
- Medicine Master default rack/shelf/bin metadata (stored in medicines.rack_location as a combined default location).
- Batch-wise rack, shelf, and bin location fields.
- Edit a batch location from the stock tracker.
- Rack-wise stock finder lists batch, medicine, shelf/bin, expiry, and quantity.

Important:
- The Supabase migration must be applied before using the updated tracker because it adds rack_number, shelf_number, and bin_location to stock_batches and grants authorized staff UPDATE through RLS.
- Frontend uses the configured public anon/publishable key only. Never use a service-role key in the browser.
- The existing app connects to the user's own Supabase project; this package has not been live-tested against that project.
