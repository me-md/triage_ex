defmodule Triage.Repo do
  use Ecto.Repo,
    otp_app: :triage_ex,
    adapter: Ecto.Adapters.Postgres
end
