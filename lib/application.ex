defmodule CatChat.Application do
  @moduledoc """
  Main Application module

  Start critical supervisors here, avoid spawning processes directly
  """

  use Application

  def start(_type, _args) do
    children = [
      CatChatStore.Repo,
      CatChatWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: CatChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    CatChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
