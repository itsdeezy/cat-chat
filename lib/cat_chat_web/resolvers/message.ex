defmodule CatChatWeb.Resolvers.Message do
  @moduledoc false
  alias Absinthe.Relay.Connection
  import CatChatStore.Factory

  def resolve(pagination_args, _ctx) do
    3
    |> build_list(:message)
    |> Connection.from_list(pagination_args)
  end

  def resolve(
    %CatChatStore.Schemas.Participant{id: id},
    pagination_args,
    _ctx
  ) do
    3
    |> build_list(:participant, participant_id: id)
    |> Connection.from_list(pagination_args)
  end
end
