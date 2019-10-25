defmodule Spoteli.Repo do
  use Ecto.Repo,
    otp_app: :spoteli,
    adapter: Ecto.Adapters.Postgres
end
