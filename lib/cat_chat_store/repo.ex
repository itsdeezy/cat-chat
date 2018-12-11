defmodule CatChatStore.Repo do
  use Ecto.Repo,
    otp_app: :cat_chat,
    adapter: Ecto.Adapters.Postgres
end
