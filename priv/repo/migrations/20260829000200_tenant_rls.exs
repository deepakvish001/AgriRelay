defmodule AgriRelay.Repo.Migrations.TenantRls do
  use Ecto.Migration
  @tables ~w(farms produce_lots pickup_requests outbox_events)
  def up do
    Enum.each(@tables, fn table ->
      execute "ALTER TABLE #{table} ENABLE ROW LEVEL SECURITY"
      execute "ALTER TABLE #{table} FORCE ROW LEVEL SECURITY"
      execute "CREATE POLICY #{table}_cooperative_policy ON #{table} USING (cooperative_id = current_setting('app.cooperative_id', true)::uuid) WITH CHECK (cooperative_id = current_setting('app.cooperative_id', true)::uuid)"
    end)
  end
  def down do
    Enum.each(@tables, fn table ->
      execute "DROP POLICY IF EXISTS #{table}_cooperative_policy ON #{table}"
      execute "ALTER TABLE #{table} DISABLE ROW LEVEL SECURITY"
    end)
  end
end
