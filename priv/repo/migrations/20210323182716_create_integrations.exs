defmodule OauthPoc.Repo.Migrations.CreateIntegrations do
  use Ecto.Migration

  def change do
    create table(:integrations) do
      add :provider, :string
      add :token, :string
      add :refresh_token, :string
      add :token_type, :string
      add :secret, :string
      add :expires, :boolean
      add :expires_at, :bigint
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:integrations, [:user_id])
  end
end
