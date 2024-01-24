
defmodule Pascal do
  @doc ~S"""
  Generates a Pascal's Triangle of `n` rows.

  ## Examples

      iex> Pascal.of(1)
      [[1]]

      iex> Pascal.of(5)
      [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
  """
  def of(n) do
    [1]
    |> Stream.iterate(fn xs ->
      mid = Enum.chunk_every(xs, 2, 1, :discard)
      |> Enum.map(fn [a, b] -> a + b end)
      [1 | mid] ++ [1]
    end)
    |> Enum.take(n)
  end
end
