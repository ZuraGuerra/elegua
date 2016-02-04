defmodule Elegua.Config do
	@user_model Application.get_env(:elegua, :user, YourApp.User)
	@email_field Application.get_env(:elegua, :email_field, :email)
	@username_field Application.get_env(:elegua, :username_field, :username)
	@password_field Application.get_env(:elegua, :password_field, :password)
	@verification_token_field Application.get_env(:elegua, :verification_token_field, :verification_token)
	@is_verified_field Application.get_env(:elegua, :is_verified_field, :is_verified)

	@app_repo Application.get_env(:elegua, :app_repo, YourApp.Repo)

	def required_fields do
		[@email_field, @username_field, @password_field]
	end

	def app_repo do
		@app_repo
	end

	def password_field do
		@password_field
	end

	def verification_token do
		@verification_token
	end

	def is_verified do
		@is_verified
	end
end