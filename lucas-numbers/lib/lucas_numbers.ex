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
    Stream.unfold({2, 1}, &calculate/1)
    |> Enum.take(count)
  end

  defp calculate({last, current}) do
    {last, {current, last + current}}
  end
end
