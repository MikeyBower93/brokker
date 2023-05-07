defmodule Brokker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Brokker.Repo,
      # Start the Telemetry supervisor
      BrokkerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Brokker.PubSub},
      # Start the Endpoint (http/https)
      BrokkerWeb.Endpoint,
      {Oban, Application.fetch_env!(:brokker, Oban)}
      # Start a worker by calling: Brokker.Worker.start_link(arg)
      # {Brokker.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Brokker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BrokkerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
