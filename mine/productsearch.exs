
defmodule Products do
  @prods ["computer", "phone", "tablet"]
  @filt [:min, :max, :name]

  @doc """
  Generate 100 name-price pairs
  name key is gotten from `@prods`

  ## Examples
    iex> Products.all_items
    [
      %{name: "computer", price: 15},
      %{name: "phone", price: 30},
      %{name: "computer", price: 48},
      %{name: "tablet", price: 18},
      %{name: "computer", ...},
      %{...},
      ...
    ]
  """
  def all_items do
    for _ <- 1..100, do: %{name: Enum.random(@prods), price: Enum.random(1..100)}
  end

  @doc """
  Searches an existing product list `items`, given optional `filters`.

  ## Filters:
    min :: integer : price lower-bound
    max :: integer : price upper-bound
    name :: binary : name to match

  ## Examples
    iex> p = Products.all_items
    [
      %{name: "computer", price: 15},
      %{name: "phone", price: 30},
      %{name: "computer", price: 48},
      %{name: "tablet", price: 18},
      %{name: "computer", ...},
      %{...},
      ...
    ]
    iex> Products.search(p, name: "computer", max: 50)
    [
      %{name: "computer", price: 30},
      %{name: "computer", price: 49},
      %{name: "computer", price: 2},
      %{name: "computer", price: 15},
      %{name: "computer", ...},
      %{...},
      ...
    ]
  """
  def search(items, filters \\ []) do
    %{name: n, max: mx, min: mn} = Enum.into(filters, Map.new(@filt, fn a -> {a,nil} end))
    for %{name: ni, price: pi} = item <- items,
      !n || ni == n,
      !mx || pi <= mx,
      !mn || pi >= mn,
      do: item
  end
end
