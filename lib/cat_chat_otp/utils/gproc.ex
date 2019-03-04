defmodule CatChatOtp.Utils.Gproc do
  @moduledoc """
  Elixir :gproc adapter module.
  """

  @doc "Lookup by term, for local processes"
  def lookup(term) do
    case :gproc.where({:n, :l, term}) do
      :undefined -> {:error, :undefined}
      pid -> {:ok, pid}
    end
  end

  @doc "Look up by pid, for local processes"
  def term(pid) do
    case pid |> :gproc.info |> Keyword.get(:gproc) do
      [{{:n, :l, term}, _}] -> {:ok, term}
      _ -> {:error, :undefined}
    end
  end
end
