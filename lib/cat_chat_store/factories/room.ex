defmodule CatChatStore.Factories.Room do
  defmacro __using__(_opts) do
    quote do
      def room_factory do
        %CatChatStore.Schemas.Room{
          id: sequence("id"),
          name: sequence("room")
        }
      end
    end
  end
end
