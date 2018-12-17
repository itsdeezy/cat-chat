defmodule CatChatOtp.RoomSupervisor do
  @moduledoc """
  Dynamic Supervisor that starts Room servers

  Supervised by: CatChat.Application
  Supervises: CatChatOtp.Room
  """

  use CatChatOtp.Macros.DynamicSupervisorTemplate

  @name __MODULE__

  def children do
    __MODULE__
    |> DynamicSupervisor.which_children()
    |> Enum.map(fn {_, pid, _, _} -> pid end)
  end

  def start_room(name) do
    DynamicSupervisor.start_child(@name, {CatChatOtp.Room, name})
  end

  def start_link do
    IO.puts("Starting CatChatOtp.RoomSupervisor")
    DynamicSupervisor.start_link(@name, :ok, name: @name)
  end
end
