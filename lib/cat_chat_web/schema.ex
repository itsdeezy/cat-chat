defmodule CatChatWeb.Schema do
  @moduledoc """
  Main GraphQL schema

  Avoid defining any types in here. Instead, create a module with your
  types and import them here.
  """
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types CatChatWeb.Types.Participant
  import_types CatChatWeb.Types.Message
  import_types CatChatWeb.Types.Room

  node interface do
    resolve_type &CatChatWeb.Resolvers.Node.resolve/2
  end

  query do
    connection field :participants, node_type: :participant do
      description "Root query field for participants"

      resolve &CatChatWeb.Resolvers.Participant.resolve/2
    end

    connection field :rooms, node_type: :room do
      description "Root query field for rooms"

      resolve &CatChatWeb.Resolvers.Room.resolve/2
    end
  end
end
