defmodule CatChatWeb.Router do
  use Phoenix.Router

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: CatChatWeb.Schema,
    interface: :advanced,
    json_codec: Jason

  forward "/", Absinthe.Plug,
    schema: CatChatWeb.Schema,
    json_codec: Jason
end
