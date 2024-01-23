
defmodule Test do
  def parseString(""), do: []
  def parseString(str) do
    {n, rest} = Integer.parse(str)
    [n | parseString(rest)]
  end
end
