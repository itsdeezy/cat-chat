defmodule CatChatWeb.Resolvers.Room do
  @moduledoc false
  alias Absinthe.Relay.Connection
  import CatChatStore.Factory

  def resolve(pagination_args, _ctx) do
    3
    |> build_list(:room)
    |> Connection.from_list(pagination_args)
  end
end
