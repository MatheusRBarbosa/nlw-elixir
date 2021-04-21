defmodule Nlwelixir.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Nlwelixir.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "app@nlwelixir.com",
      subject: "Testando email",
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    text = "---- Supplies to expire ---- \n"
    Enum.reduce(supplies, text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: exp_date,
         responsible: responsible
       }) do
    "Description: #{description}, Expiration Date: #{exp_date}, Responsible: #{responsible}\n"
  end
end
