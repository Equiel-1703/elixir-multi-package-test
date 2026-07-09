defmodule Backend1 do
  @behaviour TestApp.Backend

  @impl TestApp.Backend
  def hello() do
    IO.puts("Hello from Backend1!")
    IO.puts("This message means that the backend1 package is being used as the backend for TestApp.")
  end
end
