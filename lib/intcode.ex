defmodule IntCode do
  def parse(program) do
    program
    |> split_operators()
    |> Enum.with_index()
    |> Enum.into(%{}, fn {value, index} -> {index, value} end)
  end

  def execute(program) do
    bitcodes = parse(program)
    program = split_operators(program)

    run(program, bitcodes)
    |> Map.values()
    |> Enum.join(",")
  end

  defp run([99 | _], program), do: program
  defp run([1, input1, input2, output | rest], bitcodes) do
    %{ bitcodes | bitcodes[output] => bitcodes[input1] + bitcodes[input2] }
  end

  defp split_operators(program) do
    program
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
