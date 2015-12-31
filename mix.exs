defmodule Battlenet.Mixfile do
  use Mix.Project

  @description """
  Elixir library for the Battle.net API.
  """

  def project do
    [app: :battlenet,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: @description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
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
      {:httpoison, "~> 0.8.0"},
      {:poison, "~> 1.5"},

      {:bypass, "~> 0.1", only: :test}
    ]
  end

  defp package do
    [contributors: ["Daniel Grieve"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/cazrin/battlenet"}]
  end
end
