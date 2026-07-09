# This is a behaviour that all backends must implement.
defmodule TestApp.Backend do
  @callback hello() :: atom()

  @callback do_math(num :: integer()) :: integer()
end
