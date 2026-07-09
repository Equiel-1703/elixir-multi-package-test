defmodule Backend1 do
  @behaviour TestApp.Backend
  @on_load :on_load

  defp on_load() do
    path = :filename.join(:code.priv_dir(:backend_1), "backend_1_nifs")

    case :erlang.load_nif(path, 0) do
      :ok ->
        IO.puts("Backend1 NIFs loaded successfully.")
        :ok

      {:error, reason} ->
        IO.puts("Failed to load NIFs: #{inspect(reason)}")
        :error
    end
  end

  @impl TestApp.Backend
  def hello() do
    IO.puts("Hello, World from Backend1!")
    :ok
  end

  @impl TestApp.Backend
  def do_math(num) when is_integer(num) do
    res = do_math_nif(num)

    IO.puts("Input number: #{num}, Result from NIF: #{res}")

    res
  end

  # === NIFs stubs ===
  def do_math_nif(_num) do
    :erlang.nif_error(:nif_not_loaded)
  end
end
