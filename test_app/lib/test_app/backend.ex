# This is a behaviour that all backends must implement.
defmodule TestApp.Backend do
  @callback hello() :: atom()

  @callback sum(a :: integer(), b :: integer()) :: integer()
end
