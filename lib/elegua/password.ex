defmodule Elegua.Password do
  alias Comeonin.Bcrypt
	
  def hash(password) do
	Bcrypt.hashpwsalt(password)
  end
    
  def match_passwords(password, user) do
    Bcrypt.checkpw(password, user.password)
  end
end