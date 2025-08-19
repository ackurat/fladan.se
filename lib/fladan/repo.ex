defmodule Fladan.Repo do
  use Ecto.Repo,
    otp_app: :fladan,
    adapter: Ecto.Adapters.Postgres
end
