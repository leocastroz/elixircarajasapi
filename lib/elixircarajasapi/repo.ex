defmodule Elixircarajasapi.Repo do
  use Ecto.Repo,
    otp_app: :elixircarajasapi,
    adapter: Ecto.Adapters.Postgres
end
