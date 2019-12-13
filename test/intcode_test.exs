defmodule IntCodeTest do
  use ExUnit.Case
  doctest IntCode

  describe "parse/2" do
    test "converts a program into a map" do
      program = "1,2,0,2,3,3,99"
      assert IntCode.parse(program) == %{
        0 => 1,
        1 => 2,
        2 => 0,
        3 => 2,
        4 => 3,
        5 => 3,
        6 => 99
      }
    end
  end

  describe "execute/1" do
    test "sums values when finds operator 1" do
      program_chunk = "1,0,0,0,99"
      output = "1,2,0,0,99"

      assert ^output = IntCode.execute(program_chunk)
    end
  end
end
