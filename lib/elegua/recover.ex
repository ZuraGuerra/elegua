defmodule Elegua.Recover do
  import Ecto.Changeset, only: [put_change: 3, change]
  import String, only: [downcase: 1]
  import Atom, only: [to_string: 1]
  import Ecto.Query
  alias Elegua.{Mailer, Config, Model, Password}
  
  @app_repo Config.app_repo
  @user_model Config.user_model
  @new_password Config.new_password
  @password Config.password
  @verification_token Config.verification_token

  def new_password(email, password) do
    user = @app_repo.get_by(@user_model, email: downcase(email))
    case user do
      nil -> {:error, :no_user}
      _ -> write_new_credentials(email, password)
    end
  end

  defp write_new_credentials(email, password)
    recovery_params = %{
      to_string(@new_password) => Password.hash(password),
      to_string(@verification_token) => Ecto.UUID.generate
    }
    changeset = change(user, recovery_params)
    case @app_repo.update(changeset) do
      {:ok, user} -> user
      {:error, changeset} -> :error
    end
  end

  def change_password(token) do
    user = @app_repo.get_by(@user_model, verification_token: token)
    password_params = %{to_string(@password) => user.new_password}
    changeset = change(user, password_params)
    case @app_repo.update(changeset) do
      {:ok, user} -> user
      {:error, changeset} -> :error 
    end
  end
end