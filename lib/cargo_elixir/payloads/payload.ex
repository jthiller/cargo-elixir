defmodule CargoElixir.Payloads.Payload do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @derive {Jason.Encoder, only: [:battery,:created_at,:device_id,:elevation,:hotspot_id,:id,:lat,:lon,:oui,:reported,:rssi,:seq_num,:speed,:snr,:fingerprint]}
  schema "payloads" do
    field :device_id, :integer
    field :hotspot_id, :string
    field :oui, :integer
    field :lat, :decimal
    field :lon, :decimal
    field :speed, :decimal
    field :rssi, :decimal
    field :elevation, :decimal
    field :battery, :decimal
    field :seq_num, :integer
    field :fingerprint, :string
    field :snr, :decimal
    field :reported, :utc_datetime
    field :created_at, :utc_datetime
  end

  def changeset(payload, attrs) do
    changeset =
      payload
      |> cast(attrs, [:device_id, :hotspot_id, :oui, :lat, :lon, :speed, :rssi, :elevation, :battery, :seq_num, :reported, :fingerprint, :snr])
      |> put_change(:created_at, DateTime.utc_now |> DateTime.truncate(:second))
      |> validate_required([:device_id, :hotspot_id, :oui, :lat, :lon, :speed, :rssi, :elevation, :battery, :seq_num, :reported, :created_at, :fingerprint, :snr])
  end
end
