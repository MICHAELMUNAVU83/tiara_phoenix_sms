defmodule TiaraPhoenixSms.Repo.Migrations.CreateTests do
  use Ecto.Migration

  def change do
    create table(:tests) do
      add :name, :string
      add :body, :string

      timestamps()
    end
  end
end
