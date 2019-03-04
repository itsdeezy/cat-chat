defmodule CatChatWeb.Resolvers.Room do
  @moduledoc false
  alias Absinthe.Relay.Connection

  def resolve(pagination_args, _ctx) do
    CatChatOtp.Supervisors.Room.children
    |> Connection.from_list(pagination_args)
  end
end
