defmodule Backend2.MixProject do
  use Mix.Project

  def project do
    [
      app: :backend_2,
      version: "0.1.0",
      elixir: "~> 1.19",
      compilers: [:elixir_make] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:test_app, path: "../../test_app"},
      {:elixir_make, "~> 0.10.0", runtime: false}
    ]
  end
end
