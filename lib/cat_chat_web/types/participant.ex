defmodule CatChatWeb.Types.Participant do
  @moduledoc """
  Participant type definition
  """
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  alias Absinthe.Relay.Connection
  import CatChatStore.Factory

  connection node_type: :participant

  @desc """
  A participant, belongs to a room, has many messages
  """
  node object :participant do
    field :name, non_null(:string)

    connection field :messages, node_type: :message do
      description "A list of messages sent by this participant"

      resolve fn pagination_args, _ctx ->
        messages = build_list(pagination_args.first, :message)
        Connection.from_list(messages, pagination_args)
      end
    end
  end
end
