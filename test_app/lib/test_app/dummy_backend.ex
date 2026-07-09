defmodule TestApp.DummyBackend do
  @moduledoc false

  @behaviour TestApp.Backend

  @impl TestApp.Backend
  def hello() do
    IO.puts("Hello from DummyBackend!")
  end
end
