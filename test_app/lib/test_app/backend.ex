# This is a behaviour that all backends must implement.
defmodule TestApp.Backend do
  @callback hello() :: atom()
end
