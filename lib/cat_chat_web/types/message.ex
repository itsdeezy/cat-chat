defmodule CatChatWeb.Types.Message do
  @moduledoc """
  Message type definition
  """
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  connection node_type: :message

  @desc """
  A message, belongs to a participant
  """
  node object :message do
    field :text, non_null(:string)
  end
end
