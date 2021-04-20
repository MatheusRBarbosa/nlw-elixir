defmodule Nlwelixir do
  alias Nlwelixir.Restaurants.Create
  defdelegate create_restaurant(params), to: Create, as: :call
end
