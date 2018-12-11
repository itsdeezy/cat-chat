defmodule CatChatWeb.Types.Room do
  @moduledoc """
  Room type definition
  """
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  alias Absinthe.Relay.Connection
  import CatChatStore.Factory

  @desc """
  A room, has many participants
  """
  node object :room do
    field :name, non_null(:string)

    connection field :participants, node_type: :participant do
      description "A connection of participants in this chat"

      resolve fn pagination_args, _ctx ->
        participants = build_list(pagination_args.first, :participant)
        Connection.from_list(participants, pagination_args)
      end
    end
  end
end
