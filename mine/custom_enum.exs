defmodule CustomEnum do
  @moduledoc """
  Documentation for `CustomEnum`.
  Re-implement common [Enum](https://hexdocs.pm/elixir/Enum.html) functions using [Enum.reduce/2](https://hexdocs.pm/elixir/Enum.html#reduce/2) or [Enum.reduce/3](https://hexdocs.pm/elixir/Enum.html#reduce/3).
  """

  @doc """
  Reverse a list

  ## Examples

    iex> CustomEnum.reverse([1, 2, 3])
    [3, 2, 1]

    iex> CustomEnum.reverse([4, 5, 6, 7])
    [7, 6, 5, 4]
  """
  def reverse(list), do: Enum.reduce(list, [], fn x, acc -> [x | acc] end)

  @doc """
  Map over a list

  ## Examples

    iex> CustomEnum.map([1, 2, 3], fn integer -> integer * 2 end)
    [2, 4, 6]

    iex> CustomEnum.map([5, 4, 3], fn integer -> is_integer(integer) end)
    [true, true, true]
  """
  def map(list, callback_function) do
    list
    |> Enum.reduce([], fn x, acc -> acc ++ [callback_function.(x)] end)
  end

  @doc """
  Filter elements in a list. Keep elements that return `true` when called with the
  provided callback function.

  ## Examples

    iex> CustomEnum.filter([1, 2, "3"], fn int -> is_integer(int) end)
    [1, 2]

    iex> CustomEnum.filter([1, "2", "3"], fn char -> is_bitstring(char) end)
    ["2", "3"]
  """
  def filter(list, callback_function) do
    list
    |> Enum.reduce([], fn x, acc ->
      cond do
        callback_function.(x) -> acc ++ [x]
        true                 -> acc
      end
    end)
  end

  @doc """
  Sum a list of integers.

  ## Examples

    iex> CustomEnum.sum([1, 2, 3])
    6

    iex> CustomEnum.sum([1, 1, 1])
    3
  """
  def sum(list_of_integers), do: Enum.reduce(list_of_integers, &Kernel.+/2)

  @doc """
  Join a list of strings together.

  ## Examples

    iex> CustomEnum.join(["A", "B", "C"])
    "ABC"

    iex> CustomEnum.join(["Hello", ",", " ", "World", "!"])
    "Hello, World!"
  """
  def join(list_of_strings), do: Enum.reduce(list_of_strings, & &2 <> &1)
end
