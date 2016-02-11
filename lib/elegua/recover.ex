defmodule Elegua.Recover do
  import Ecto.Changeset, only: [put_change: 3]
  import String, only: [downcase: 1]
  import Ecto.Query
  alias Elegua.{Mailer, Config}
  
  @app_repo Config.app_repo
  @user_model Config.user_model

  def send_link(email) do
    user = @app_repo.get_by(@user_model, email: downcase(email))

  end
end