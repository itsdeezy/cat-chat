defmodule CatChatWeb.Types.Room do
  @moduledoc """
  Room type definition
  """
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  connection node_type: :room

  node object :room do
    description "A room, has many participants"

    field :name, non_null(:string)

    connection field :participants, node_type: :participant do
      description "A connection of participants in this chat"

      resolve &CatChatWeb.Resolvers.Participant.resolve/3
    end
  end
end
