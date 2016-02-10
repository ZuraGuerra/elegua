defmodule Elegua.Session do
  import Plug.Conn
  alias Elegua.Authenticate, as: Auth
  
  def new(conn, email, password) do
    case Auth.authenticate({:email, email}, password) do
      {:ok, user} -> put_session(conn, :user_id, user.id)
      error -> error
      _ -> :error
    end
  end
end