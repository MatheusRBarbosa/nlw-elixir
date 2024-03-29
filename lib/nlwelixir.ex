defmodule Nlwelixir do
  alias Nlwelixir.Restaurants.Create, as: RestaurantCreate
  alias Nlwelixir.Supplies.Create, as: SupplyCreate
  alias Nlwelixir.Supplies.Get, as: SupplyGet

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate get_supply(params), to: SupplyGet, as: :call
end
