defmodule CatChatWeb.Resolvers.Participant do
  @moduledoc false
  alias Absinthe.Relay.Connection
  import CatChatStore.Factory

  def resolve(pagination_args, _ctx) do
    CatChatOtp.Supervisors.Participant.children()
    |> Connection.from_list(pagination_args)
  end

  def resolve(%{name: name}, pagination_args, _ctx) do
    CatChatOtp.Room.participants_in(name)
    |> Connection.from_list(pagination_args)
  end
end
