use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :nlwelixir, Nlwelixir.Repo,
  username: "postgres",
  password: "senha123",
  database: "nlwelixir_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :nlwelixir, Nlwelixir.Mailer, adapter: Bamboo.TestAdapter

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :nlwelixir, NlwelixirWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
