# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :triage_ex,
  namespace: Triage,
  ecto_repos: [Triage.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :triage_ex, TriageWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gFa7tvb0uktFoY8eRrvdujWH6dAnJWfWRMZkh3O2C2tNNsPNZSIEqu8H6ivcgwmf",
  render_errors: [view: TriageWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Triage.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
