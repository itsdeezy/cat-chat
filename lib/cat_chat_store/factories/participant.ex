defmodule CatChatStore.Factories.Participant do
  defmacro __using__(_opts) do
    quote do
      def participant_factory do
        %CatChatStore.Schemas.Participant{
          id: sequence("id"),
          name: sequence("participant")
        }
      end
    end
  end
end
