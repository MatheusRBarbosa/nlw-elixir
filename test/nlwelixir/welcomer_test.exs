defmodule Nlwelixir.WelcomerTest do
  use ExUnit.Case, async: true

  alias Nlwelixir.Welcomer

  describe "welcome/1" do
    test "Caso special X" do
      params = %{"name" => "banana", "age" => "42"}
      expect = {:ok, "Special X"}

      result = Welcomer.welcome(params)

      assert result == expect
    end

    test "Caso normal mas maior que 18" do
      params = %{"name" => "qualquer", "age" => "20"}
      expect = {:ok, "Normal qualquer"}

      result = Welcomer.welcome(params)

      assert result == expect
    end

    test "Menor de idade" do
      params = %{"name" => "qualquer", "age" => "15"}
      expect = {:error, "Block"}

      result = Welcomer.welcome(params)

      assert result == expect
    end
  end
end
