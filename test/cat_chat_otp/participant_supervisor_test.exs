defmodule CatChatOtp.ParticipantSupervisorTest do
  use ExUnit.Case, async: true
  alias CatChatOtp.ParticipantSupervisor

  @a_participant "participant"
  @another_participant "another_participant"

  setup do
    Application.stop(:cat_chat)
    :ok = Application.start(:cat_chat)
    {:ok, participant} = ParticipantSupervisor.start_participant(@a_participant)
    %{participant: participant}
  end

  describe "Chatparticipant.ParticipantSupervisor interface" do
    test "lists all participants with children/0", %{participant: part} do
      assert [^part] = ParticipantSupervisor.children()
    end

    test "can start a participant with start_participant/1" do
      assert {:ok, _} =
               ParticipantSupervisor.start_participant(@another_participant)
    end
  end
end
