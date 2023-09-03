defmodule TiaraPhoenixSms.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :phone_number, :string
      add :text_message, :string

      timestamps()
    end
  end
end
