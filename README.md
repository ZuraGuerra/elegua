# Elegua

**TODO: Add description**
## Setup
Add your model specifications to config. 
```elixir
config :elegua, # These are the default values, but imagine a model like:
  user_model: YourApp.User, # MyApp.Player
  app_repo: YourApp.Repo, # MyApp.Repo
  password_field: :password, # :passphrase
  username_field: :username, # :user
  email_field: :email, # :mail
  # these two are only needed if you'd like to verify users' email
  verification_token_field: :verification_token, # :token
  is_verified_field: :is_verified # :active
```

## Use
### Registration
```elixir
defmodule MyApp.Registration do
  alias MyApp.MyUser

  def create(params) do
    changeset =
      Elegua.changeset(%MyUser{}, params)
      |> MyUser.another_changeset(params)
      # And so on ad infinitum

    if changeset.valid? do
      {:ok, user} = Elegua.register(changeset)
      # Other happy things
    else
      # Handle error
    end

  end

end
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add elegua to your list of dependencies in `mix.exs`:

        def deps do
          [{:elegua, "~> 0.0.1"}]
        end

  2. Ensure elegua is started before your application:

        def application do
          [applications: [:elegua]]
        end

