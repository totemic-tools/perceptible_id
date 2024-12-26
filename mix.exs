defmodule PerceptibleId.MixProject do
  use Mix.Project

  @source_url "https://github.com/totemic-tools/perceptible_id"
  @version "1.0.0"

  def project do
    [
      app: :perceptible_id,
      docs: docs(),
      version: @version,
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: @source_url,
      homepage_url: @source_url
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:benchee, "~> 1.3", only: :dev},
      {:ex_doc, "~> 0.36", only: :dev}
    ]
  end

  defp description do
    """
    An ID generation tool that avoids visually ambiguous characters.
    """
  end

  defp docs do
    [
      main: "readme",
      name: "PerceptibleId",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/perceptible_id",
      source_url: @source_url,
      extras: ["README.md", "CHANGELOG.md", "LICENSE"]
    ]
  end

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url},
      maintainers: ["Angelo Lakra"]
    ]
  end
end
