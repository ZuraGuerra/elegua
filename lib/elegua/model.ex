defmodule Elegua.Model do
  import Ecto.Changeset

  alias Elegua.Config

  @required_fields Config.required_fields
  @optional_fields [Config.verification_token_field, Config.is_verified_field]
  @verification_required_fields @required_fields ++ @optional_fields

  def changeset(user, params \\ :empty) do
  	user
  	|> cast(params, @required_fields, @optional_fields)
  end

  def verification_changeset(user, params \\ :empty) do
  	user
  	|> cast(params, @verification_required_fields, [])
  end

end