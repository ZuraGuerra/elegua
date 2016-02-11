defmodule Elegua.Model do
  import Ecto.Changeset

  alias Elegua.Config

  @required_fields Config.base_required_fields
  @optional_fields [Config.verification_token_field, Config.is_verified_field]
  @verification_required_fields @required_fields ++ @optional_fields
  @recovery_fields [Config.verification_token_field, Config.new_password_field]
  @recovery_required_fields @required_fields ++ @recovery_fields ++ Config.is_verified_field

  def changeset(user, params \\ :empty) do
  	user
  	|> cast(params, @required_fields, @optional_fields)
  end

  def verification_changeset(user, params \\ :empty) do
  	user
  	|> cast(params, @verification_required_fields, [])
  end

  def recovery_changeset(user, params \\ :empty) do
    user
    |> cast(params, @recovery_required_fields, [])
  end

end