defmodule CatChatWeb.Schema do
  @moduledoc """
  Main GraphQL schema

  Avoid defining anything in here. Instead, create a module with your
  types/queries/mutations and import them here.
  """
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern
  import CatChatStore.Factory

  import_types CatChatWeb.Types.Participant
  import_types CatChatWeb.Types.Message
  import_types CatChatWeb.Types.Room

  node interface do
    resolve_type &CatChatWeb.Resolvers.Node.resolve/2
  end

  query do
    field :participants, list_of(:participant) do
      resolve fn _args, _ctx ->
        {:ok, build_list(3, :participant)}
      end
    end

    field :messages, list_of(:message) do
      resolve fn _args, _ctx ->
        {:ok, build_list(3, :message)}
      end
    end

    field :rooms, list_of(:room) do
      resolve fn _args, _ctx ->
        {:ok, build_list(3, :room)}
      end
    end
  end
end
