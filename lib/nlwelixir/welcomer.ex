defmodule Nlwelixir.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "Special X"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Normal #{name}"}
  end

  defp evaluate(_name, _age) do
    {:error, "Block"}
  end
end
