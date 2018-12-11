defmodule CatChatWeb.Schema do
  @moduledoc """
  Main GraphQL schema

  Avoid defining anything in here. Instead, create a module with your
  types/queries/mutations and import them here.
  """
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types CatChatWeb.Types.Participant
  import_types CatChatWeb.Types.Message
  import_types CatChatWeb.Types.Room

  node interface do
    resolve_type &CatChatWeb.Resolvers.Node.resolve/2
  end

  @test_messages [%{id: 1, text: "hi"}]
  @test_participants [%{id: 1, name: "dude", messages: @test_messages}]
  @test_rooms [%{id: 1, name: "test", participants: @test_participants}]

  query do
    field :participants, list_of(:participant) do
      resolve fn _args, _ctx ->
        {:ok, @test_participants}
      end
    end

    field :messages, list_of(:message) do
      resolve fn _args, _ctx ->
        {:ok, @test_messages}
      end
    end

    field :rooms, list_of(:room) do
      resolve fn _args, _ctx ->
        {:ok, @test_rooms}
      end
    end
  end
end
