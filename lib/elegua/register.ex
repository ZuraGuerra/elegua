defmodule Elegua.Register do
  import Ecto.Changeset, only: [put_change: 3]
  
  alias Elegua.Config
  alias Elegua.Password

  @password_field Config.password_field

  def create(changeset) do
  	hashed_password = Password.hash(changeset.params[Atom.to_string(@password_field)])
  	changeset
  	|> put_change(@password_field, hashed_password)
  	|> Config.app_repo.insert
  end

end