defmodule CatChatWeb.Resolvers.Participant do
  @moduledoc false
  alias Absinthe.Relay.Connection
  import CatChatStore.Factory

  def resolve(pagination_args, _ctx) do
    3
    |> build_list(:participant)
    |> Connection.from_list(pagination_args)
  end

  def resolve(%CatChatStore.Schemas.Room{id: id}, pagination_args, _ctx) do
    3
    |> build_list(:participant, room_id: id)
    |> Connection.from_list(pagination_args)
  end
end
