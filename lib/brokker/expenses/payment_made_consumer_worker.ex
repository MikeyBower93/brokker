defmodule Brokker.Expenses.PaymentMadeConsumerWorker do
  use Oban.Worker
  require Logger

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"payment_id" => id}}) do
    Logger.warn("Creating expense for payment id '#{id}'")
    :ok
  end
end
