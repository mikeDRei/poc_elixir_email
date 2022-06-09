defmodule PocEmailElixirWeb.UserController do
  use PocEmailElixirWeb, :controller

  alias PocEmailElixir.Accounts
  alias PocEmailElixir.Service.EmailServer
  alias PocEmailElixir.Accounts.User

  action_fallback PocEmailElixirWeb.FallbackController

  def welcome_email(conn, %{"user" => user_params}) do
    try do
      user =  Accounts.User.changeset(%User{}, user_params).changes

      if(Accounts.User.changeset(%User{}, user_params).valid?) do
        EmailServer.welcome_send_email(user)
        conn
        |> put_status(:ok)
        |> json(%{
          message: "Email successfully sent!",
          status: 200,
          email: user
        })
      else
        conn
        |> put_status(:bad_request)
        |> json(%{
          message: "Error sending email, check the parameters informed.",
          status: 400,
          user_params: user_params
        })
      end
      rescue
        e ->
          conn
          |> put_status(:internal_server_error)
          |> json(e.message)
    end
  end
end
