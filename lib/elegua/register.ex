defmodule Elegua.Register do
  import Ecto.Changeset, only: [put_change: 3]
  
  alias Elegua.Config
  alias Elegua.Password

  @password_field Config.password_field
  @verification_token_field Config.verification_token_field

  def create(changeset) do
  	hashed_password = Password.hash(changeset.params[Atom.to_string(@password_field)])
  	changeset
  	|> put_change(@password_field, hashed_password)
  	|> Config.app_repo.insert
  end

  def create(changeset, :verify) do
  	hashed_password = Password.hash(changeset.params[Atom.to_string(@password_field)])
  	verification_token = Ecto.UUID.generate
  	changeset
  	|> put_change(@password_field, hashed_password)
  	|> put_change(@verification_token_field, verification_token)
  	|> Config.app_repo.insert
  end

end