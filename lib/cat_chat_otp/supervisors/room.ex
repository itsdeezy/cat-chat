defmodule CatChatOtp.Supervisors.Room do
  @moduledoc """
  Dynamic Supervisor that starts Room servers

  Supervised by: CatChat.Application
  Supervises: CatChatOtp.Room
  """

  use Supervisor

  @name __MODULE__

  def start_link([]) do
    IO.puts("Starting #{ @name }")
    Supervisor.start_link(@name, :ok, name: @name)
  end

  def init(:ok) do
    Supervisor.init([], strategy: :one_for_one)
  end

  def start_room(name) do
    Supervisor.start_child(@name, {CatChatOtp.Room, name})
  end

  def children do
    @name
    |> Supervisor.which_children()
    |> Enum.map(fn {id, pid, _, _} ->
      case CatChatOtp.Utils.Gproc.term(pid) do
        {:ok, {CatChatOtp.Room, room_name}} -> %{id: id, name: room_name}
        {:error, :undefined} -> {:error, :undefined}
      end
    end)
  end
end
