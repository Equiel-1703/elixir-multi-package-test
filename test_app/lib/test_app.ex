defmodule TestApp do
  defp backend, do: Application.fetch_env!(:test_app, :backend)

  def main() do
    IO.puts("-- Hello from TestApp! --")
    IO.puts("Checking which backend is being used...")

    IO.puts("\n-> Using backend: #{backend()}\n")
    backend().hello()

    IO.puts("\nDoing some math using the backend...")
    _result = backend().do_math(5)

    IO.puts("\n-- End of TestApp execution --")

    :ok
  end
end
