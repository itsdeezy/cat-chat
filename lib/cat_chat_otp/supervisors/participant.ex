defmodule CatChatOtp.Supervisors.Participant do
  @moduledoc """
  Dynamic Supervisor that starts Participant servers

  Supervised by: CatChat.Application
  Supervises: CatChatOtp.Participant
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

  def start_participant(name) do
    Supervisor.start_child(@name, {CatChatOtp.Participant, name})
  end

  def children do
    @name
    |> Supervisor.which_children()
    |> Enum.map(fn {id, pid, _, _} ->
      case CatChatOtp.Utils.Gproc.term(pid) do
        {:ok, {CatChatOtp.Participant, participant}} ->
            %{id: id, name: participant}
        {:error, :undefined} -> {:error, :undefined}
      end
    end)
  end
end
