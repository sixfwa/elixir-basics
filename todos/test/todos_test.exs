defmodule TodosTest do
  use ExUnit.Case
  doctest Todos

  test "greets the world" do
    assert Todos.hello() == :world
  end
end
