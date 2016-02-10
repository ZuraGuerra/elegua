defmodule Elegua.Authenticate do
  import String, only: [downcase: 1]
  alias Ecto.Query
  alias Elegua.Config
  alias Elegua.Password

  @app_repo Config.app_repo
  @user_model Config.user_model

  def authenticate({:email, email}, password) do
    user = @app_repo.get_by(@user_model, email: downcase(email))
    case check_credentials(user, password) do
      true -> {:ok, user}
      :no_user -> {:error, :no_user}
      _ -> {:error, :invalid_password}
    end   
  end

  defp check_credentials(user, password) do
    case user do
      nil -> :no_user
      _ -> Password.match_passwords(password, user)
    end
  end
end