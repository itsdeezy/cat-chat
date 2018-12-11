defmodule CatChatWeb.Types.Participant do
  @moduledoc """
  Participant type definition
  """
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  alias Absinthe.Relay.Connection

  connection node_type: :participant

  @desc """
  A participant, belongs to a room, has many messages
  """
  node object :participant do
    field :name, non_null(:string)

    connection field :messages, node_type: :message do
      description "A list of messages sent by this participant"

      resolve fn pagination_args, %{source: participant} ->
        Connection.from_list(participant.messages, pagination_args)
      end
    end
  end
end
