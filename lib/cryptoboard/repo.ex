defmodule Cryptoboard.Repo do
  use Ecto.Repo,
    otp_app: :cryptoboard,
    adapter: Ecto.Adapters.Postgres
end
