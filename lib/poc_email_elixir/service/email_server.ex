defmodule PocEmailElixir.Service.EmailServer do
  use Bamboo.Phoenix, view: PocEmailElixirWeb.UserView
  use Bamboo.Mailer, otp_app: :poc_email_elixir
  
  import Bamboo.Email

  def welcome_send_email(user) do
    try do
      new_email()
      |> from(user.from)
      |> to(String.split(user.to,","))
      |> bcc(String.split(user.cc,","))
      |> subject(user.subject)
      |> assign(:user, user)
      |> render("create-user-email.html")
      |> deliver_now()
      {:ok, %{message: "Email successfully sent!", user: user, status: 200}}
      rescue
      e ->
      {:error, %{message: "failed to send email!", status: 400}}
      end
  end

  def welcome_email(user) do
    new_email(
      from: user.from,
      to: user.to,
      cc: user.cc,
      bcc: user.cc,
      subject: user.subject,
      text_body: "Welcome to the app",
      html_body: "<strong>Welcome to the app</strong>"
    )
  end
end
