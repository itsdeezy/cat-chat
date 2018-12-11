defmodule CatChatWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :cat_chat

  plug Plug.RequestId
  plug Plug.Logger

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Jason

  plug CatChatWeb.Router
end
