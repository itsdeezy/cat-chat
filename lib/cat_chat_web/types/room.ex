defmodule CatChatWeb.Types.Room do
  @moduledoc """
  Room type definition
  """
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  alias Absinthe.Relay.Connection

  @desc """
  A room, has many participants
  """
  node object :room do
    field :name, non_null(:string)

    connection field :participants, node_type: :participant do
      description "A connection of participants in this chat"

      resolve fn pagination_args, %{source: room} ->
        Connection.from_list(room.participants, pagination_args)
      end
    end
  end
end
