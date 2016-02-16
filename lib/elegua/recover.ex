defmodule Elegua.Recover do
  import Ecto.Changeset, only: [put_change: 3, change: 2]
  import String, only: [downcase: 1]
  import Ecto.Query
  alias Elegua.{Mailer, Config, Model, Password}
  
  @app_repo Config.app_repo
  @user_model Config.user_model
  @new_password Config.new_password_field
  @password Config.password_field
  @verification_token Config.verification_token_field

  def new_password(email, password) do
    user = @app_repo.get_by(@user_model, email: downcase(email))
    case user do
      nil -> {:error, :no_user}
      _ -> write_new_credentials(user, email, password)
    end
  end

  defp write_new_credentials(user, email, password) do
    recovery_params = %{
      @new_password => Password.hash(password),
      @verification_token => Ecto.UUID.generate
    }
    changeset = change(user, recovery_params)
    case @app_repo.update(changeset) do
      {:ok, user} -> {:ok, user}
      {:error, changeset} -> :error
    end
  end

  def change_password(token) do
    user = @app_repo.get_by(@user_model, verification_token: token)
    case user do
      nil -> {:error, :no_user}
      _ ->
        password_params = %{@password => user.new_password}
        changeset = change(user, password_params)
        case @app_repo.update(changeset) do
          {:ok, user} -> {:ok, user}
          {:error, changeset} -> :error 
        end
    end
  end
end