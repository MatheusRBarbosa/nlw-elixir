defmodule NlwelixirWeb.SuppliesController do
  use NlwelixirWeb, :controller

  alias Nlwelixir.FallbackController
  alias Nlwelixir.Supply

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Nlwelixir.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Nlwelixir.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end
