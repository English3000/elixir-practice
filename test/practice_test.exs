defmodule PracticeTest do
  use ExUnit.Case
  doctest Practice

  test "greets the world" do
    assert Practice.hello() == :world
  end

  test "longest_consecutive_sequence/1 works" do
    assert Practice.longest_consecutive_sequence([100,4,200,1,3,2]) == 4

    assert Practice.longest_consecutive_sequence([0,3,7,2,5,8,4,6,0,1]) == 9
  end
end
