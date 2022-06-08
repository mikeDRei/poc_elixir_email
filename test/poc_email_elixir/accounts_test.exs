defmodule PocEmailElixir.AccountsTest do
  use PocEmailElixir.DataCase

  alias PocEmailElixir.Accounts

  describe "users" do
    alias PocEmailElixir.Accounts.User

    import PocEmailElixir.AccountsFixtures

    @invalid_attrs %{cc: nil, from: nil, subject: nil, text_body: nil, to: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{cc: "some cc", from: "some from", subject: "some subject", text_body: "some text_body", to: "some to"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.cc == "some cc"
      assert user.from == "some from"
      assert user.subject == "some subject"
      assert user.text_body == "some text_body"
      assert user.to == "some to"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{cc: "some updated cc", from: "some updated from", subject: "some updated subject", text_body: "some updated text_body", to: "some updated to"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.cc == "some updated cc"
      assert user.from == "some updated from"
      assert user.subject == "some updated subject"
      assert user.text_body == "some updated text_body"
      assert user.to == "some updated to"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
