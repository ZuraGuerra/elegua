defmodule Elegua.Register do
  import Ecto.Changeset, only: [put_change: 3]
  import Ecto.Query
  
  alias Elegua.Config
  alias Elegua.Password
  alias Elegua.Model

  @password_field Config.password_field
  @verification_token_field Config.verification_token_field
  @is_verified_field Config.is_verified_field
  @app_repo Config.app_repo

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
  	user = user_by_token(token)
  	params = %{Atom.to_string(@is_verified_field) => true}
  	changeset = Model.verification_changeset(user, params)
    @app_repo.update(changeset)
  end

  defp hash_pasword(changeset) do
  	password = changeset.params[Atom.to_string(@password_field)]
  	Password.hash(password)
  end

  defp user_by_token(token) do
  	@app_repo.one from user in Config.user_model,
  	where: user.verification_token == ^token
  end

end