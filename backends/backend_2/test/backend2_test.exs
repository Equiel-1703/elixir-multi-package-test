defmodule Backend2Test do
  use ExUnit.Case

  test "backend 1 with core app" do
    assert TestApp.main() == :ok
  end
end
