defmodule NlwelixirWeb.RestaurantsControllerTest do
  use NlwelixirWeb.ConnCase, async: true

  describe "create/2" do
    test "Cria usuario", %{conn: conn} do
      params = %{name: "Restaurant", email: "email@email.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Teste",
               "restaurant" => %{
                 "email" => "email@email.com",
                 "id" => _id,
                 "name" => "Restaurant"
               }
             } = response
    end

    test "Error ao criar usuario", %{conn: conn} do
      params = %{name: "Restaurant"}

      expected = %{"error" => %{"email" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert expected == response
    end
  end
end
