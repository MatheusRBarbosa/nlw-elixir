defmodule Nlwelixir.Repo do
  use Ecto.Repo,
    otp_app: :nlwelixir,
    adapter: Ecto.Adapters.Postgres
end
