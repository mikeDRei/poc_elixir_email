defmodule PocEmailElixir.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :cc, :string
    field :from, :string
    field :subject, :string
    field :text_body, :string
    field :to, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:from, :to, :cc, :subject, :text_body])
    |> validate_required([:from, :to, :cc, :subject, :text_body])
  end
end
