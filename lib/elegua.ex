defmodule Elegua do

  alias Elegua.{Register, Model, Mailer, Session, Recover}
  alias Elegua.Authenticate, as: Auth

  def changeset(user, params), do: Model.changeset(user, params)
  def register(changeset), do: Register.create(changeset)
  def register(changeset, opts), do: Register.create(changeset, opts)

  def send_verification_email(to, from, subject, {content_type, content}) do
	Mailer.send(to, from, subject, {content_type, content})
  end
  def verify(token), do: Register.verify(token)

  def authenticate({:email, email}, password), do: Auth.authenticate({:email, email}, password)
  def login(conn, email, password), do: Session.create(conn, email, password)
  def current_user(conn), do: Session.current_user(conn)
  def logged_in?(conn), do: !!current_user(conn)
  def logout(conn), do: Session.delete(conn)

  def new_password(email, password), do: Recover.new_password(email, password)
  def change_password(token), do: Recover.change_password(token)
end
