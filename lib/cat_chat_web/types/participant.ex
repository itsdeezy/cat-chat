defmodule CatChatWeb.Types.Participant do
  @moduledoc """
  Participant type definition
  """
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  connection node_type: :participant

  node object :participant do
    description "A participant, belongs to a room, has many messages"

    field :name, non_null(:string)

    connection field :messages, node_type: :message do
      description "A list of messages sent by this participant"

      resolve &CatChatWeb.Resolvers.Message.resolve/3
    end
  end
end
