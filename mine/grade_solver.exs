
defmodule GradeSolver do
  def grades_ge, do: [{3, 1.25}, {3, 1.75}, {3, 1}, {3, 1.75}, {3, 1.25}, {2, 1.25}, {3, 1.75}]
  def grades, do: [{3, 1.75}, {3, 1}, {3, 1.25}]

  def solve(grades) do
    grades
    |> Enum.map_reduce(0, fn {unit, grade}, units -> {grade * unit, units + unit} end)
    |> then(fn {grades, units} -> Enum.sum(grades) / units end)
  end
end
