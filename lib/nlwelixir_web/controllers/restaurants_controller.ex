defmodule NlwelixirWeb.RestaurantsController do
  use NlwelixirWeb, :controller

  alias Nlwelixir.Restaurant
  alias Nlwelixir.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Nlwelixir.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
