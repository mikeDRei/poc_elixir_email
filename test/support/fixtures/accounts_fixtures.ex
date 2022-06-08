defmodule PocEmailElixir.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PocEmailElixir.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        cc: "some cc",
        from: "some from",
        subject: "some subject",
        text_body: "some text_body",
        to: "some to"
      })
      |> PocEmailElixir.Accounts.create_user()

    user
  end
end
