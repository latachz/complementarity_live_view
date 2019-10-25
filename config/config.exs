# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :spoteli,
  ecto_repos: [Spoteli.Repo]

# Configures the endpoint
config :spoteli, SpoteliWeb.Endpoint,
  url: [host: "localhost"],
  live_view: [
    signing_salt: "K5VG6rDVYu7x8Bajag3ZfTr0WdeSSVha"
  ],
  secret_key_base: "CW2o0OsXSX9VzUGUG2B1dxUMhDnEsHO4SeYEdR0GBGhP9/EL21eD/YBDnhRXYkob",
  render_errors: [view: SpoteliWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Spoteli.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
