defmodule Elegua do

	alias Elegua.Register
	alias Elegua.Model
	alias Elegua.Mailer
    alias Elegua.Authenticate, as: Auth

	def changeset(user, params) do
		Model.changeset(user, params)
	end

	def register(changeset) do
		Register.create(changeset)
	end

	def register(changeset, opts) do
		Register.create(changeset, opts)
	end

	def send_verification_email(to, from, subject, {content_type, content}) do
		Mailer.send_verification_email(to, from, subject, {content_type, content})
	end

	def verify(token) do
		Register.verify(token)
	end

    def authenticate({:email, email}, password) do
        Auth.authenticate({:email, email}, password)
    end
end
