defmodule OauthPoc.Accounts.Integration do
  use Ecto.Schema
  import Ecto.Changeset

  schema "integrations" do
    field :provider, :string
    field :token, :string
    field :refresh_token, :string
    field :token_type, :string
    field :secret, :string
    field :expires, :boolean
    field :expires_at, :integer
    belongs_to :user, OauthPoc.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(integration, attrs) do
    integration
    |> cast(attrs, [:provider, :token, :refresh_token, :token_type, :secret, :expires, :expires_at, :user_id])
    |> validate_required([:provider, :user_id])
  end
end
