defmodule Backend2Test do
  use ExUnit.Case
  doctest Backend2

  test "greets the world" do
    assert Backend2.hello() == :world
  end
end
