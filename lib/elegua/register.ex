defmodule Elegua.Register do
	user = Application.get_env(:elegua, :user, "User")
	user_email = Application.get_env(:elegua, :user_email, "email")
	username = Application.get_env(:elegua, :username, "username")
	user_password = Application.get_env(:elegua, :user_password, "password")
	user_password_confirmation = Application.get_env(:elegua, :user_password_confirmation, "password_confirmation")
	user_hashed_password = Application.get_env(:elegua, :user_hashed_password, "hashed_password")
end