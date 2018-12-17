defmodule CatChatOtp.Utils.Gproc do
  @moduledoc """
  Elixir :gproc adapter module.
  """

  @doc """
  Lookup by name, for local processes
  """
  def lookup(term) do
    case :gproc.where({:n, :l, term}) do
      :undefined -> {:error, :undefined}
      pid -> {:ok, pid}
    end
  end
end
