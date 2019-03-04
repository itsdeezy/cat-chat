defmodule CatChatOtp.Room do
  @moduledoc """
  GenServer Room process

  Supervised by: CatChatOtp.Supervisors.Room
  """

  use GenServer

  @proc_type :n
  @proc_scope :l
  @name __MODULE__

  def add_participant_into(room, participant_name) do
    {:ok, pid} = CatChatOtp.Utils.Gproc.lookup({@name, room})

    GenServer.cast(pid, {:add_participant, participant_name})
  end

  def participants_in(room) do
    {:ok, pid} = CatChatOtp.Utils.Gproc.lookup({@name, room})

    GenServer.call(pid, :participants)
  end

  def handle_cast({:add_participant, participant_name}, state) do
    {:ok, pid} =
      CatChatOtp.Supervisors.Participant.start_participant(participant_name)

    %{participants: participants} = state
    new_state = %{participants: Map.put(participants, participant_name, pid)}

    {:noreply, new_state}
  end

  def handle_call(:participants, _from, state) do
    %{participants: participants} = state;

    participant_maps = Enum.map(participants, fn {name, _pid} ->
      %{id: name, name: name}
    end)

    {:reply, participant_maps, state}
  end

  def child_spec(room_name) do
    %{
      id: room_name,
      start: {@name, :start_link, [room_name]},
      restart: :temporary,
      type: :worker
    }
  end

  def start_link(room_name) do
    IO.puts("Starting #{ @name }: #{ room_name }")
    GenServer.start_link(@name, :ok, name: via_tuple(room_name))
  end

  def init(:ok) do
    {:ok, %{participants: %{}}}
  end

  defp via_tuple(room_name) do
    {:via, :gproc, {@proc_type, @proc_scope, {@name, room_name}}}
  end
end
