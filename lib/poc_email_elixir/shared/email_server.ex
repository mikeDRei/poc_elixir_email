defmodule PocEmail.Shared.EmailServer do
  use Bamboo.Phoenix, view: PocEmailWeb.UserView
  use Bamboo.Mailer, otp_app: :poc_email
  
  import Bamboo.Email

def send_email_create_user(user) do
  new_email()
  |> from({"Michael","michaalvesreino@gmail.com"})
  |> to(["Angel@gmail.com","douglas@gmail.com"])
  |> subject("Welcome!!")
  |> assign(:user, user)
  |> render("create-user-email.html")
  |> deliver_now()
  |> IO.inspect()
  end
end
