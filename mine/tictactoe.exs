
defmodule TicTacToe do
  @moduledoc """
    Documentation for `TicTacToe`
  """

  @doc """
  Read a coordinate on a board.

  ## Examples

      We've used a board with letter symbols for sake of example.

      iex> board = [
      ...> ["A", "B", "C"],
      ...> ["D", "E", "F"],
      ...> ["G", "H", "I"]
      ...> ]
      iex> TicTacToe.at(board, {0, 0})
      "G"
      iex> TicTacToe.at(board, {2, 1})
      "F"
      iex> TicTacToe.at(board, {0, 2})
      "A"
  """
  def at(board, {x, y}) do
    board
    |> Enum.at(-y-1)
    |> Enum.at(x)
  end

  @doc """
  Fill in a coordinate on a board with the provided symbol and return a new updated board.

  ## Examples

      iex> board = [
      ...> [nil, nil, nil],
      ...> [nil, nil, nil],
      ...> [nil, nil, nil]
      ...> ]
      iex> TicTacToe.fill(board, {0, 0}, "X")
      [[nil, nil, nil], [nil, nil, nil], ["X", nil, nil]]
      iex> TicTacToe.fill(board, {1, 1}, "O")
      [[nil, nil, nil], [nil, "O", nil], [nil, nil, nil]]
  """
  def fill(board, {x,y}, symbol) do
    board
    |> List.update_at(-y-1, fn a ->
        List.update_at(a, x, fn _ -> symbol
        end)
    end)
  end

  @doc """
  Determine if a player has won the game.

  ## Examples

    Row Wins:

    iex> TicTacToe.winner([["X", "X", "X"], [nil, nil, nil], [nil, nil, nil]])
    "X"
    iex> TicTacToe.winner([[nil, nil, nil], ["X", "X", "X"], [nil, nil, nil]])
    "X"
    iex> TicTacToe.winner([[nil, nil, nil], [nil, nil, nil], ["X", "X", "X"]])
    "X"

    Column Wins:

    iex> TicTacToe.winner([["X", nil, nil], ["X", nil, nil], ["X", nil, nil]])
    "X"
    iex> TicTacToe.winner([[nil, "X", nil], [nil, "X", nil], [nil, "X", nil]])
    "X"
    iex> TicTacToe.winner([[nil, nil, "X"], [nil, nil, "X"], [nil, nil, "X"]])
    "X"

    Diagonal Wins

    iex> TicTacToe.winner([["X", nil, nil], [nil, "X", nil], [nil, nil, "X"]])
    "X"
    iex> TicTacToe.winner([[nil, nil, "X"], [nil, "X", nil], ["X", nil, nil]])
    "X"

    No Winner

    iex> TicTacToe.winner([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    nil
    iex> TicTacToe.winner([[nil, "X", nil], [nil, "X", nil], [nil, nil, nil]])
    nil

  """
  def winner(board) do
    chck = fn d = [a,b,c] -> a == b and b == c and d != [nil,nil,nil] end
    rows = Enum.filter(board, &chck.(&1))
    cols = Enum.zip_with(board, & &1) |> Enum.filter(&chck.(&1))
    digs = [Enum.zip([0..2, 0..2]), Enum.zip([0..2, 2..0])]
    |> Enum.map(fn a -> Enum.map(a, &at(board, &1)) end) |> Enum.filter(&chck.(&1))

    Enum.concat([rows, cols, digs]) |> List.flatten |> List.first
  end
end
