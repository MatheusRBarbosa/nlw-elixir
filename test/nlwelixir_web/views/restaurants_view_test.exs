defmodule NlwelixirWeb.RestaurantsViewTest do
  use NlwelixirWeb.ConnCase, async: true

  import Phoenix.View

  alias Nlwelixir.Restaurant
  alias NlwelixirWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Restaurante", email: "email@gmail.com"}

      {:ok, restaurant} = Nlwelixir.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Teste",
               restaurant: %Restaurant{
                 email: "email@gmail.com",
                 name: "Restaurante",
                 id: _id
               }
             } = response
    end
  end
end
