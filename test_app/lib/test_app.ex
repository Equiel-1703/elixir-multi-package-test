defmodule TestApp do
  defp backend, do: Application.fetch_env!(:test_app, :backend)

  def main() do
    IO.puts("Hello from TestApp!")
    IO.puts("Checking which backend is being used...")

    IO.puts("Using backend: #{backend()}")
    backend().hello()

    IO.puts("Adding two numbers using the backend's sum function...")
    _result = backend().sum(3, 5)

    IO.puts("End of TestApp execution.")

    :ok
  end
end
