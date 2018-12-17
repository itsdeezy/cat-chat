defmodule CatChatOtp.RoomSupervisorTest do
  use ExUnit.Case, async: true
  alias CatChatOtp.RoomSupervisor

  @a_room "room"
  @another_room "another_room"

  setup do
    Application.stop(:cat_chat)
    :ok = Application.start(:cat_chat)
    {:ok, room} = RoomSupervisor.start_room(@a_room)
    %{room: room}
  end

  describe "Chatroom.RoomSupervisor interface" do
    test "lists all rooms with children/0", %{room: room} do
      assert [^room] = RoomSupervisor.children()
    end

    test "can start a room with start_room/1" do
      assert {:ok, _} = RoomSupervisor.start_room(@another_room)
    end
  end
end
