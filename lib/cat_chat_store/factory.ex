defmodule CatChatStore.Factory do
  use ExMachina, repo: CatChatStore.Repo

  use CatChatStore.Factories.Message
  use CatChatStore.Factories.Participant
  use CatChatStore.Factories.Room
end
