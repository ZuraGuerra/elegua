defmodule Elegua.Config do
	def required_fields do
		[email_field, username_field, password_field]
	end

	def app_repo do
		Application.get_env(:elegua, :app_repo, YourApp.Repo)
	end

	def user_model do
		Application.get_env(:elegua, :user_model, YourApp.User)
	end

	def email_field do
		Application.get_env(:elegua, :email_field, :email)
	end

	def username_field do
		Application.get_env(:elegua, :username_field, :username)
	end

	def password_field do
		Application.get_env(:elegua, :password_field, :password)
	end

	def verification_token_field do
		Application.get_env(:elegua, :verification_token_field, :verification_token)
	end

	def is_verified_field do
		Application.get_env(:elegua, :is_verified_field, :is_verified)
	end
end