defmodule FizzBuzz do
  @doc """
  FizzBuzz.

  ## Examples

    iex> FizzBuzz.run(1..15)
    [1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz", 13, 14, "fizzbuzz"]

    iex> FizzBuzz.run(10..15)
    ["buzz", 11, "fizz", 13, 14, "fizzbuzz"]
  """
  @divs [fizz: 3, buzz: 5]    # prefer keyword list over map because order matters
  def run(range) do
    Enum.map(range, fn n ->
      res = for {word, dividend} when rem(n, dividend) == 0 <- @divs, do: word  # comprehension on divisible
      unless Enum.empty?(res), do: Enum.join(res), else: n                      # atoms joined become string
    end)
  end

end
