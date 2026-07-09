defmodule Backend1.MixProject do
  use Mix.Project

  def project do
    [
      app: :backend_1,
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
      test_app_dep(),
      {:elixir_make, "~> 0.10.0", runtime: false}
    ]
  end

  defp test_app_dep() do
    if File.exists?("../../test_app") do
      IO.puts("[Backend1's mix.exs] Using local path for test_app")

      {:test_app, path: "../../test_app"}
    else
      IO.puts("[Backend1's mix.exs] Using git path for test_app")

      {:test_app, git: "https://github.com/Equiel-1703/elixir-multi-package-test.git", sparse: "test_app"}
    end
  end
end
