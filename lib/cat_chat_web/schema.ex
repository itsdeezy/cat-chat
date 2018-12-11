defmodule CatChatWeb.Schema do
  @moduledoc """
  Main GraphQL schema

  Avoid defining anything in here. Instead, create a module with your
  types/queries/mutations and import them here.
  """
  use Absinthe.Schema

  # Example data
  @items %{
    "foo" => %{id: "foo", name: "Foo"},
    "bar" => %{id: "bar", name: "Bar"}
  }

  object :item do
    desc("An item")
    field :id, :id
    field :name, :string
  end

  query do
    field :item, :item do
      arg(:id, non_null(:id))

      resolve(fn %{id: item_id}, _ ->
        {:ok, @items[item_id]}
      end)
    end
  end
end
