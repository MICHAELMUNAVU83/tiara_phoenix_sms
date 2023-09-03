defmodule TiaraPhoenixSms.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TiaraPhoenixSms.Messages` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        phone_number: "some phone_number",
        text_message: "some text_message"
      })
      |> TiaraPhoenixSms.Messages.create_message()

    message
  end
end
