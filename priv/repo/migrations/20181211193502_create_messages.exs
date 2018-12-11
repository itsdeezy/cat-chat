defmodule CatChat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :text, :string
      add :participant_id, references(:participants, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:messages, [:participant_id])
  end
end
