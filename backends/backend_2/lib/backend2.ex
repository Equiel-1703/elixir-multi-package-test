defmodule Backend2 do
  @behaviour TestApp.Backend
  @on_load :on_load

  defp on_load() do
    path = :filename.join(:code.priv_dir(:backend_2), "backend_2_nifs")

    case :erlang.load_nif(path, 0) do
      :ok ->
        IO.puts("Backend2 NIFs loaded successfully!")

      {:error, reason} ->
        IO.puts("Failed to load NIFs.")
        IO.puts("Reason: #{inspect(reason)}")

        raise "Error: #{inspect(reason)}"
    end
  end

  @impl TestApp.Backend
  def hello() do
    IO.puts("Hello, World from Backend2!")
    :ok
  end

  @impl TestApp.Backend
  def do_math(num) do
    result = do_math_nif(num)

    IO.puts("Input number: #{num}, Result from NIF: #{result}")

    result
  end

  # === NIFs stubs ===
  def do_math_nif(_num) do
    :erlang.nif_error(:nif_not_loaded)
  end
end
