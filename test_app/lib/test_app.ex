defmodule TestApp do
  defp backend, do: Application.fetch_env!(:test_app, :backend)

  def main() do
    IO.puts("Hello from TestApp!")

    IO.puts("Checking which backend is being used...")

    case backend() do
      nil ->
        IO.puts("No backend configured.")

      backend ->
        IO.puts("Using backend: #{backend}")
        backend.hello()
    end
  end
end
