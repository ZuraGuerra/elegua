defmodule Elegua.Session do
  import Plug.Conn
  alias Elegua.Authenticate, as: Auth
  alias Elegua.Config
  
  @app_repo Config.app_repo
  @user_model Config.user_model
  
  def create(conn, email, password) do
    case Auth.authenticate({:email, email}, password) do
      {:ok, user} -> put_session(conn, :user_id, user.id)
      error -> error
      _ -> :error
    end
  end

  def current_user(conn) do
    user_id = get_session(conn, :user_id)
    if user_id, do: @app_repo.get(@user_model, user_id)
  end

  def delete(conn) do
    delete_session(conn, :user_id)
  end
end