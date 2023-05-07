defmodule Brokker.Utils.MessageBroker do
  def queue_publication(multi, event, payload) do
    consumers = Application.get_env(:brokker, :message_broker_consumers)[event]

    Oban.insert_all(
      multi,
      :jobs,
      Enum.map(consumers, fn consumer -> consumer.new(payload) end)
    )
  end
end
