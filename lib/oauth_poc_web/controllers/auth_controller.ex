defmodule OauthPocWeb.AuthController do
  @moduledoc """
  Auth controller responsible for handling Ueberauth responses
  """

  use OauthPocWeb, :controller

  plug Ueberauth

  alias Ueberauth.Strategy.Helpers
  alias OauthPoc.Accounts

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to connect.")
    |> redirect(to: Routes.user_settings_path(conn, :edit))
  end

  def callback(%{assigns: %{current_user: user, ueberauth_auth: auth}} = conn, _params) do
    Accounts.update_or_create_integration(user, auth)

    conn
    |> put_flash(:info, "Successfully connected.")
    |> redirect(to: Routes.user_settings_path(conn, :edit))
  end
end
