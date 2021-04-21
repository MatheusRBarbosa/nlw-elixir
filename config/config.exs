# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :nlwelixir,
  ecto_repos: [Nlwelixir.Repo]

config :nlwelixir, Nlwelixir.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :nlwelixir, Nlwelixir.Mailer, adapter: Bamboo.LocalAdapterd

# Configures the endpoint
config :nlwelixir, NlwelixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4WHngfa1DxPWEpAtGoEjce8ZiJ5fT1/t+QSUPm8UUBvapUbRH+IIayGPXvOOkJT/",
  render_errors: [view: NlwelixirWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Nlwelixir.PubSub,
  live_view: [signing_salt: "vsDEGDbc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
