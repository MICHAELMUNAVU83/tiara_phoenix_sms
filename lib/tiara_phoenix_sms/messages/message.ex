defmodule TiaraPhoenixSms.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :phone_number, :string
    field :text_message, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:phone_number, :text_message])
    |> validate_format(
      :phone_number,
      ~r/^254\d{9}$/,
      message: "Number has to start with 254 and have 12 digits"
    )
    |> validate_required([:phone_number, :text_message])
  end
end
