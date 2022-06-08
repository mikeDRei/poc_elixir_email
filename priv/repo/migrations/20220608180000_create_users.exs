defmodule PocEmailElixir.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :from, :string
      add :to, :string
      add :cc, :string
      add :subject, :string
      add :text_body, :string

      timestamps()
    end
  end
end
