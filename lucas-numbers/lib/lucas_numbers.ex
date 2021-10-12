defmodule LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio (φ or ϕ)

  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """
  def generate(term) when not is_number(term), do: raise ArgumentError, message: "count must be specified as an integer >= 1"
  def generate(term) when term < 1, do: raise ArgumentError, message: "count must be specified as an integer >= 1"
  def generate(1), do: [2]
  def generate(2), do: [2, 1]
  def generate(count) do
    3..count
    |> Stream.scan(generate(2), &calculate/2)
    |> Enum.to_list()
    |> List.flatten()
    |> Enum.uniq()
    |> List.insert_at(0, 2)
  end

  defp calculate(_, [h | [t]]) do
    [t, h + t]
  end
end
