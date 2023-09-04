defmodule TiaraPhoenixSms.Tests.Test do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tests" do
    field :name, :string
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(test, attrs) do
    test
    |> cast(attrs, [:name, :body])
    |> validate_required([:name, :body])
  end
end
