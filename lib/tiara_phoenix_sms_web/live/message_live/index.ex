defmodule TiaraPhoenixSmsWeb.MessageLive.Index do
  use TiaraPhoenixSmsWeb, :live_view

  alias TiaraPhoenixSms.Messages
  alias TiaraPhoenixSms.Messages.Message

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :messages, list_messages())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Message")
    |> assign(:message, Messages.get_message!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Message")
    |> assign(:message, %Message{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Messages")
    |> assign(:message, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    message = Messages.get_message!(id)
    {:ok, _} = Messages.delete_message(message)

    {:noreply, assign(socket, :messages, list_messages())}
  end

  def handle_event("test", _params, socket) do
    url = "http://localhost:4000/api/tests"

    sms_headers = [
      {
        "Content-Type",
        "application/json"
      }
    ]

    body =
      %{
        "name" => "Testing Name",
        "body" => "Testing Body"
      }
      |> Poison.encode!()

    IO.inspect(HTTPoison.post(url, body, sms_headers))

    {:noreply, socket}
  end

  defp list_messages do
    Messages.list_messages()
  end
end
