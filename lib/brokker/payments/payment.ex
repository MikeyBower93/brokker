defmodule Brokker.Payment do
  alias Brokker.Repo
  alias Brokker.Utils.MessageBroker

  def create_payment() do
    Ecto.Multi.new()
    |> MessageBroker.queue_publication(:payment_created, %{payment_id: 1, merchant: "Ocado"})
    |> Repo.transaction()
  end
end
