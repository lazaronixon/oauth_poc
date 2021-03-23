# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :oauth_poc,
  ecto_repos: [OauthPoc.Repo]

# Configures the endpoint
config :oauth_poc, OauthPocWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GPtX31GCZeEcP5DH/pjVNio4ppLlHcX/ndzH7oeP0iS7oAlxJLJ4c2Vz3Oxr5Gjm",
  render_errors: [view: OauthPocWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: OauthPoc.PubSub,
  live_view: [signing_salt: "ynXjZaAm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    facebook: {Ueberauth.Strategy.Facebook, []}
  ]
