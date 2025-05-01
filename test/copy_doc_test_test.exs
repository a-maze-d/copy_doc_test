defmodule CopyDocTestTest do
  use ExUnit.Case
  doctest CopyDocTest

  test "greets the world" do
    assert CopyDocTest.hello() == :world
  end
end
