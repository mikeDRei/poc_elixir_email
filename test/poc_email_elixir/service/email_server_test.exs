defmodule PocEmailElixir.Service.EmailServerTest do
  use ExUnit.Case
  use Bamboo.Test
  alias PocEmailElixir.Service.EmailServer

  @moduletag user: %{from: "michael@gmail.com", to: "michael@gmail.com", cc: "michael@alves", text_body: "asas", subject: "asasa"} 
  @moduletag bad_request: {:error, %{message: "failed to send email!", status: 400}}
  
  describe "welcome_send_email/1" do
    test "email successfully sent", %{user: user} do
      send_email = EmailServer.welcome_send_email(user)
      assert send_email == {:ok, %{message: "Email successfully sent!", user: user, status: 200}}
    end

    test "failed to send email", %{bad_request: bad_request} do
      send_email = EmailServer.welcome_send_email("")
      assert send_email == bad_request
    end
  end

  describe "welcome email/1" do
    test "unit test param header :from" , %{user: user} do
      email = EmailServer.welcome_email(user)
      assert email.to == user.from
    end

    test "unit test param header :to" , %{user: user} do
      email = EmailServer.welcome_email(user)
      assert email.to == user.to
    end

    test "unit test param header :bcc" , %{user: user} do
      email = EmailServer.welcome_email(user)
      assert email.bcc == user.cc
    end

    test "unit test param header :cc" , %{user: user} do
      email = EmailServer.welcome_email(user)
      assert email.cc == user.cc
    end

    test "unit test param  header :subject" , %{user: user} do
      email = EmailServer.welcome_email(user)
      assert email.subject == user.subject
    end

    test "unit test param body :html_body" , %{user: user} do
      email = EmailServer.welcome_email(user)
      assert email.html_body =~ "Welcome to the app"
    end
  end
end
