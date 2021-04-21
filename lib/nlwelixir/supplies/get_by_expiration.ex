defmodule Nlwelixir.Supplies.GetByExpiration do
  import Ecto.Query

  alias Nlwelixir.{Repo, Restaurant, Supply}

  def call do
    today = Date.utc_today()
    beginning = Date.beginning_of_week(today)
    ending = Date.end_of_week(today)

    query =
      from supply in Supply,
        where: supply.expiration_date >= ^beginning and supply.expiration_date <= ^ending,
        preload: [:restaurant]

    query
    |> Repo.all()
    |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end)
  end
end
