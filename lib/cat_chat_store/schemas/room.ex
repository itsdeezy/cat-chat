defmodule CatChatStore.Schemas.Room do
  use Ecto.Schema
  import Ecto.Changeset
  alias CatChatStore.Schemas

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "rooms" do
    field :name, :string

    has_many :participants, Schemas.Participant
    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
