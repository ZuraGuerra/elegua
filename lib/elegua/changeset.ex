defmodule Elegua.Changeset do
  import Ecto.Changeset

  alias Elegua.Register

  @required_fields Register.required_fields
  @optional_fields

  def changeset(user, params \\ :empty) do
  	user
  	|> cast(params, @required_fields, @optional_fields)
  end

end