defmodule Nlwelixir.RestaurantTest do
  use Nlwelixir.DataCase, async: true

  alias Ecto.Changeset
  alias Nlwelixir.Restaurant

  describe "changeset/1" do
    test "Tudo certo" do
      params = %{name: "Restaurant", email: "email@email.com"}
      response = Restaurant.changeset(params)

      assert %Changeset{changes: %{name: "Restaurant", email: "email@email.com"}, valid?: true} =
               response
    end

    test "Changeset invalido" do
      params = %{name: "s", email: ""}
      expected = %{email: ["can't be blank"], name: ["should be at least 2 character(s)"]}

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response
      assert errors_on(response) == expected
    end
  end
end
