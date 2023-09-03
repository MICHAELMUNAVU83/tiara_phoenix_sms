defmodule TiaraPhoenixSms.MessagesTest do
  use TiaraPhoenixSms.DataCase

  alias TiaraPhoenixSms.Messages

  describe "messages" do
    alias TiaraPhoenixSms.Messages.Message

    import TiaraPhoenixSms.MessagesFixtures

    @invalid_attrs %{phone_number: nil, text_message: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messages.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messages.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{phone_number: "some phone_number", text_message: "some text_message"}

      assert {:ok, %Message{} = message} = Messages.create_message(valid_attrs)
      assert message.phone_number == "some phone_number"
      assert message.text_message == "some text_message"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{phone_number: "some updated phone_number", text_message: "some updated text_message"}

      assert {:ok, %Message{} = message} = Messages.update_message(message, update_attrs)
      assert message.phone_number == "some updated phone_number"
      assert message.text_message == "some updated text_message"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_message(message, @invalid_attrs)
      assert message == Messages.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messages.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messages.change_message(message)
    end
  end
end
