defmodule NlwelixirWeb.RestaurantsView do
  use NlwelixirWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Teste",
      restaurant: restaurant
    }
  end
end
