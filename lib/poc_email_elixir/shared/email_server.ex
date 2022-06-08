defmodule PocEmailElixir.Shared.EmailServer do
  use Bamboo.Phoenix, view: PocEmailElixirWeb.UserView
  use Bamboo.Mailer, otp_app: :poc_email_elixir
  
  import Bamboo.Email

  def welcome_send_email(user) do
    email_header(user)
    |> assign(:user, user)
    |> render("create-user-email.html")
    |> deliver_now()
  end

  def email_header(user) do
    new_email()
    |> from({"michael",user.from})
    |> to(user.to)
    |> subject(user.subject)
  end
end
