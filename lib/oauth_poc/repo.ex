defmodule OauthPoc.Repo do
  use Ecto.Repo,
    otp_app: :oauth_poc,
    adapter: Ecto.Adapters.Postgres
end
