defmodule CatChatWeb.Types.Message do
  @moduledoc """
  Message type definition
  """
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  connection node_type: :message

  node object :message do
    description "A message, belongs to a participant"

    field :text, non_null(:string)
  end
end
