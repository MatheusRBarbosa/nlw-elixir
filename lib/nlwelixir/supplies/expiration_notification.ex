defmodule Nlwelixir.Supplies.ExpirationNotification do
  alias Nlwelixir.Mailer
  alias Nlwelixir.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    Enum.each(data, fn {to_email, supplies} ->
      to_email
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliv(er_later!())
    end)
  end
end
