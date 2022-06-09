defmodule PocEmailElixir.Service.EmailServer do
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
    |> from(user.from)
    |> to(String.split(user.to,","))
    |> bcc(String.split(user.cc,","))
    |> subject(user.subject)
  end
end
