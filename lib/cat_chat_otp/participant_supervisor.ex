defmodule CatChatOtp.ParticipantSupervisor do
  @moduledoc """
  Dynamic Supervisor that starts Participant servers

  Supervised by: CatChat.Application
  Supervises: CatChatOtp.Participant
  """

  use CatChatOtp.Macros.DynamicSupervisorTemplate

  @name __MODULE__

  def children do
    __MODULE__
    |> DynamicSupervisor.which_children()
    |> Enum.map(fn {_, pid, _, _} -> pid end)
  end

  def start_participant(name) do
    DynamicSupervisor.start_child(@name, {CatChatOtp.Participant, name})
  end

  def start_link do
    IO.puts("Starting CatChatOtp.ParticipantSupervisor")
    DynamicSupervisor.start_link(@name, :ok, name: @name)
  end
end
