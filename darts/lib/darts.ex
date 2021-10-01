defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    h = :math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))
    cond do
      h <= 1.0 -> 10
      h <= 5.0 -> 5
      h <= 10.0 -> 1
      true -> 0
    end
  end
end
