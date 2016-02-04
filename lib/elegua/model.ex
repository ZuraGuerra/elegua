defmodule Elegua.Model do
  import Ecto.Changeset

  alias Elegua.Config

  @required_fields Config.required_fields
  @optional_fields [Config.verification_token_field, Config.is_verified_field]

  def changeset(user, params \\ :empty) do
  	user
  	|> cast(params, @required_fields, @optional_fields)
  end

end