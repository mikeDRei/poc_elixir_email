# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :poc_email_elixir,
  ecto_repos: [PocEmailElixir.Repo]

# Configures the endpoint
config :poc_email_elixir, PocEmailElixirWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: PocEmailElixirWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PocEmailElixir.PubSub,
  live_view: [signing_salt: "Uca3gJ/Q"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :poc_email_elixir, PocEmailElixir.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :poc_email, PocEmail.Shared.EmailServer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.ethereal.email",
  hostname: "smtp.ethereal.email",
  port: 587,
  username: "vicky.keebler56@ethereal.email", # or {:system, "SMTP_USERNAME"}
  password: "qdYNd1FVB1q635f7KS", # or {:system, "SMTP_PASSWORD"}
  sandbox: false,
  tls: :if_available, # can be `:always` or `:never`
  allowed_tls_versions: [:"tlsv1", :"tlsv1.1", :"tlsv1.2"], # or {:system, "ALLOWED_TLS_VERSIONS"} w/ comma separated values (e.g. "tlsv1.1,tlsv1.2")
  ssl: false, # can be `true`
  retries: 1,
  no_mx_lookups: false, # can be `true`
  auth: :if_available # can be `:always`. If your smtp relay requires authentication set it to `:always`.

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
