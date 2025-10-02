defmodule ErrorThrower.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ErrorThrowerWeb.Telemetry,
      ErrorThrower.Repo,
      {DNSCluster, query: Application.get_env(:error_thrower, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ErrorThrower.PubSub},
      # Start a worker by calling: ErrorThrower.Worker.start_link(arg)
      # {ErrorThrower.Worker, arg},
      # Start to serve requests, typically the last entry
      ErrorThrowerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ErrorThrower.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ErrorThrowerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
