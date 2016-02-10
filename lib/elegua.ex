defmodule Elegua do

  alias Elegua.Register
  alias Elegua.Model
  alias Elegua.Mailer
  alias Elegua.Authenticate, as: Auth
  alias Elegua.Session

  def changeset(user, params), do: Model.changeset(user, params)
  def register(changeset), do: Register.create(changeset)
  def register(changeset, opts), do: Register.create(changeset, opts)

  def send_verification_email(to, from, subject, {content_type, content}) do
	Mailer.send_verification_email(to, from, subject, {content_type, content})
  end
  def verify(token), do: Register.verify(token)

  def authenticate({:email, email}, password), do: Auth.authenticate({:email, email}, password)
  def login(email, password), do: Session.new(email, password)
end
