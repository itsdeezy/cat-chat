defmodule CatChatStore.Schemas.Participant do
  use Ecto.Schema
  import Ecto.Changeset
  alias CatChatStore.Schemas

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "participants" do
    field :name, :string
    field :room_id, :binary_id

    has_many :messages, Schemas.Message
    timestamps()
  end

  @doc false
  def changeset(participant, attrs) do
    participant
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
