defmodule Brokker.Repo do
  use Ecto.Repo,
    otp_app: :brokker,
    adapter: Ecto.Adapters.Postgres
end
