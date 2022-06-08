defmodule PocEmailElixir.Repo do
  use Ecto.Repo,
    otp_app: :poc_email_elixir,
    adapter: Ecto.Adapters.Postgres
end
