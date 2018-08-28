defmodule ChattyTest do
  use ExUnit.Case
  doctest Chatty

  test "greets the world" do
    assert Chatty.hello() == :world
  end
end
