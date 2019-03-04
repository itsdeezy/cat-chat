defmodule CatChatWeb.Resolvers.Message do
  @moduledoc false
  alias Absinthe.Relay.Connection
  import CatChatStore.Factory

  def resolve(%{name: name}, pagination_args, _ctx) do
    name
    |> CatChatOtp.Participant.messages_from()
    |> Connection.from_list(pagination_args)
  end
end
