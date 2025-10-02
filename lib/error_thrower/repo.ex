defmodule ErrorThrower.Repo do
  use Ecto.Repo,
    otp_app: :error_thrower,
    adapter: Ecto.Adapters.Postgres
end
