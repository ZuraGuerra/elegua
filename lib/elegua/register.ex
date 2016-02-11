defmodule Elegua.Register do
  import Ecto.Changeset, only: [put_change: 3]
  
  alias Elegua.{Config, Password, Model}

  @password_field Config.password_field
  @verification_token_field Config.verification_token_field
  @is_verified_field Config.is_verified_field
  @app_repo Config.app_repo
  @user_model Config.user_model

  def create(changeset) do
  	hashed_password = hash_pasword(changeset)
  	changeset
  	|> put_change(@password_field, hashed_password)
  	|> Config.app_repo.insert
  end

  def create(changeset, :verify) do
  	hashed_password = hash_pasword(changeset)
  	verification_token = Ecto.UUID.generate
  	changeset
  	|> put_change(@password_field, hashed_password)
  	|> put_change(@verification_token_field, verification_token)
  	|> @app_repo.insert
  end

  def verify(token) do
  	user = @app_repo.get_by(@user_model, verification_token: token)
  	params = %{Atom.to_string(@is_verified_field) => true}
  	changeset = Model.verification_changeset(user, params)
    @app_repo.update(changeset)
  end

  defp hash_pasword(changeset) do
  	password = changeset.params[Atom.to_string(@password_field)]
  	Password.hash(password)
  end

end