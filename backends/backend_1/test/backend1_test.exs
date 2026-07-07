defmodule Backend1Test do
  use ExUnit.Case
  doctest Backend1

  test "greets the world" do
    assert Backend1.hello() == :world
  end
end
