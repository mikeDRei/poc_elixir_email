# PocEmailElixir

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

change the settings for the email client of your choice. 
example:

```elixir
config :poc_email_elixir, PocEmailElixir.Service.EmailServer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.ethereal.email",
  hostname: "smtp.ethereal.email",
  port: 587,
  username: "",
  password: "", 
  authentication: :plain,
  enable_starttls_auto: true,
  sandbox: false

```
example 2:

```elixir
   config :poc_email_elixir, PocEmailElixir.Service.EmailServer,
    adapter: Bamboo.SendGridAdapter,
    api_key: ""

```
route: http://localhost:4000/api/welcome_email 
body_params to api:

```json
{
  "user":
    {
      "from":"dart@gmail.com",
	    "to":"junior@neo,diablo@gmail.com",
	    "subject":"Welcome!!",
	    "cc":"michael.alves@gmail.com,asas@gmail.com",
			"text_body":"elixir dev"
    }
}

```
