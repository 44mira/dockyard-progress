
defmodule Anagram do
  def solve(str) do
    str
    |> to_charlist
    |> perms
    |> Enum.map(&to_string/1)
  end

  defp rots(xs) do
    xs
    |> Stream.iterate(fn [h | t] -> t ++ [h] end)
    |> Enum.take(length(xs))
  end

  defp perms([]), do: [[]]
  defp perms([h | t]) do
    perms(t) |> Enum.flat_map(&rots([h | &1]))
  end
end
