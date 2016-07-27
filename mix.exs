defmodule Elegua.Mixfile do
  use Mix.Project

  def project do
    [app: :elegua,
     version: "0.8.23",
     elixir: "~> 1.2",
     description: description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:mailgun, "~> 0.1.2"},
      {:comeonin, "~> 2.1"},
      {:plug, "~> 1.1"},
      {:ecto, "~> 1.1"}
    ]
  end

  defp description do
    """
    User authentication with mail verification.
    """
  end

  defp package do
    [# These are the default files included in the package
     files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Zura Guerra"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/ZuraGuerra/elegua",
              "Example app" => "http://github.com/ZuraGuerra/oduduwa"}]
  end
end
