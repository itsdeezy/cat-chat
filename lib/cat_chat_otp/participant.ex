defmodule CatChatOtp.Participant do
  @moduledoc """
  GenServer Participant process

  Supervised by: CatChatOtp.Supervisors.Participant
  """

  use GenServer

  @proc_type :n
  @proc_scope :l
  @name __MODULE__

  def messages_from(name) do
    {:ok, pid} = CatChatOtp.Utils.Gproc.lookup({@name, name})

    GenServer.call(pid, :messages)
  end

  def handle_call(:messages, _from, state) do
    %{messages: messages} = state

    {:reply, messages, state}
  end

  def child_spec(participant_name) do
    %{
      id: participant_name,
      start: {@name, :start_link, [participant_name]},
      restart: :temporary,
      type: :worker
    }
  end

  def start_link(participant_name) do
    IO.puts("Starting #{ @name }: #{ participant_name }")
    GenServer.start_link(@name, :ok, name: via_tuple(participant_name))
  end

  def init(:ok) do
    {:ok, %{messages: []}}
  end

  defp via_tuple(participant_name) do
    {:via, :gproc, {@proc_type, @proc_scope, {@name, participant_name}}}
  end
end
