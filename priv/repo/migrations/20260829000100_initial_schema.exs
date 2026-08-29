defmodule AgriRelay.Repo.Migrations.InitialSchema do
  use Ecto.Migration
  def change do
    execute "CREATE EXTENSION IF NOT EXISTS postgis", "DROP EXTENSION IF EXISTS postgis"
    create table(:cooperatives, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :text, null: false
      timestamps(type: :utc_datetime_usec)
    end
    create table(:farms, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :cooperative_id, references(:cooperatives, type: :uuid, on_delete: :delete_all), null: false
      add :name, :text, null: false
      add :location, :geography
      timestamps(type: :utc_datetime_usec)
    end
    create index(:farms, [:cooperative_id])
    execute "CREATE INDEX farms_location_gist ON farms USING GIST (location)", "DROP INDEX farms_location_gist"
    create table(:produce_lots, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :cooperative_id, references(:cooperatives, type: :uuid), null: false
      add :crop, :text, null: false
      add :quantity_kg, :decimal, null: false
      add :quality_grade, :text
      timestamps(type: :utc_datetime_usec)
    end
    create table(:pickup_requests, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :cooperative_id, references(:cooperatives, type: :uuid), null: false
      add :produce_lot_id, references(:produce_lots, type: :uuid), null: false
      add :status, :text, null: false, default: "requested"
      add :scheduled_for, :utc_datetime_usec
      timestamps(type: :utc_datetime_usec)
    end
    create table(:outbox_events) do
      add :cooperative_id, :uuid, null: false
      add :topic, :text, null: false
      add :payload, :map, null: false
      add :published_at, :utc_datetime_usec
      timestamps(type: :utc_datetime_usec)
    end
  end
end
