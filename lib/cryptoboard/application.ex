defmodule Cryptoboard.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CryptoboardWeb.Telemetry,
      Cryptoboard.Repo,
      {DNSCluster, query: Application.get_env(:cryptoboard, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Cryptoboard.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Cryptoboard.Finch},
      # Start a worker by calling: Cryptoboard.Worker.start_link(arg)
      # {Cryptoboard.Worker, arg},
      # Start to serve requests, typically the last entry
      CryptoboardWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cryptoboard.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CryptoboardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
