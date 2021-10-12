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
    |> Enum.take(count - 2)
    |> List.last()
  end

  defp calculate(_, acc) do
    {first, rem} = List.pop_at(acc, length(acc) - 1)
    {second, _} = List.pop_at(rem, length(rem) - 1)
    acc ++ [first + second]
  end
end
