
defmodule Pokemon do
  @moduledoc """
  Pokemon struct

  ## Examples
      iex> attacker = %Pokemon{name: "Charmander", type: :fire, health: 20.0, attack: 5, speed: 20}
      iex> defender = %Pokemon{name: "Bulbasaur", type: :grass, health: 20.0, attack: 5, speed: 20}
      iex> Pokemon.attack(attacker, defender)
      %Pokemon{name: "Bulbasaur", type: :grass, health: 10.0, attack: 5, speed: 20}
  """
  defstruct [:name, :type, :health, :attack, :speed]

  @doc """
  Makes `attacker` attack `defender`. Dealing `a_attack` damage affected by their types.
  Super-effective attacks get *2, not effective attacks get /2.

  Returns modified `defender`
  """
  def attack(_attacker = %{type: a_type, attack: a_attack}, defender = %{type: d_type, health: d_health}) do
    damage = a_attack * case {a_type, d_type} do
      {type, type}     -> 1       # matching types
      {:fire, :grass}  -> 2
      {:water, :fire}  -> 2
      {:grass, :water} -> 2
      _not_effective   -> 0.5
    end
    %Pokemon{defender | health: d_health - damage}
  end
end
