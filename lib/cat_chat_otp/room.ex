defmodule CatChatOtp.Room do
  @moduledoc """
  GenServer Room process

  Supervised by: CatChatOtp.RoomSupervisor
  """

  use GenServer
  alias CatChatOtp.Utils.Gproc

  @proc_type :n
  @proc_scope :l
  @proc_key __MODULE__

  def lookup(name) do
    Gproc.lookup({@proc_key, name})
  end

  def start_link(name) do
    IO.puts("Starting new CatChatOtp.Room - #{name}")
    GenServer.start_link(__MODULE__, :ok, name: via_tuple(name))
  end

  def init(:ok) do
    {:ok, nil}
  end

  def child_spec(name) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [name]},
      restart: :temporary,
      type: :worker
    }
  end

  defp via_tuple(name) do
    {:via, :gproc, {@proc_type, @proc_scope, {@proc_key, name}}}
  end
end
