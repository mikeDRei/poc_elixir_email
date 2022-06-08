defmodule PocEmailElixirWeb.UserView do
  use PocEmailElixirWeb, :view
  alias PocEmailElixirWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      from: user.from,
      to: user.to,
      cc: user.cc,
      subject: user.subject,
      text_body: user.text_body
    }
  end
end
