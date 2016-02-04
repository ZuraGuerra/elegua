defmodule Elegua.Config do
	user_model = Application.get_env(:elegua, :user, "YourApp.User")
	email_field = Application.get_env(:elegua, :email_field, :email)
	username_field = Application.get_env(:elegua, :username_field, :username)
	password_field = Application.get_env(:elegua, :password_field, :password)

	app_repo = Application.get_env(:elegua, :app_repo, "YourApp.Repo")

	def required_fields do
		[email_field, username_field, password_field]
	end
end