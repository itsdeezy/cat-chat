defmodule CatChatStore.Factories.Message do
  defmacro __using__(_opts) do
    quote do
      def message_factory do
        %CatChatStore.Schemas.Message{
          id: sequence("id"),
          text: sequence("message")
        }
      end
    end
  end
end
