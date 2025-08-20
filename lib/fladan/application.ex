defmodule Fladan.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {
        Ecto.Migrator,
        repos: Application.fetch_env!(:fladan, :ecto_repos),
        skip: Application.fetch_env!(:fladan, :skip_migration)
      },
      FladanWeb.Telemetry,
      Fladan.Repo,
      {DNSCluster, query: Application.get_env(:fladan, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Fladan.PubSub},
      FladanWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fladan.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FladanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
