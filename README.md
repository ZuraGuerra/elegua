# Elegua

**TODO: Add description**
## Setup
Add your model specifications to config. 
```elixir
config :elegua, # These are the default values, but imagine a model like:
  user_model: YourApp.User, # MyApp.Player
  password_field: :password, # :passphrase
  username_field: :username, # :user
  email_field: :email # :mail
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

