defmodule Backend1 do
  @behaviour TestApp.Backend
  @on_load :on_load

  defp on_load() do
    path = :filename.join(:code.priv_dir(:backend_1), "backend_1_nifs")

    case :erlang.load_nif(path, 0) do
      :ok ->
        IO.puts("NIFs loaded successfully.")
        :ok

      {:error, reason} ->
        IO.puts("Failed to load NIFs: #{inspect(reason)}")
        :error
    end
  end

  @impl TestApp.Backend
  def hello() do
    IO.puts("Hello from Backend1!")
    IO.puts(
      "This message means that the backend1 package is being used as the backend for TestApp."
    )
  end

  @impl TestApp.Backend
  def sum(a, b) when is_integer(a) and is_integer(b) do
    res = sum_numbers_nif(a, b)

    IO.puts("Sum of #{a} and #{b} is: #{res}")

    res
  end

  # === NIFs stubs ===
  def sum_numbers_nif(_a, _b) do
    :erlang.nif_error(:nif_not_loaded)
  end
end
