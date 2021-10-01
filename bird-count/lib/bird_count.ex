defmodule BirdCount do

  def today([]), do: nil
  def today([today | _]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest]), do: [today + 1 | rest]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | rest]), do: has_day_without_birds?(rest)

  def total(list), do: total(list, 0)
  defp total([], acc), do: acc
  defp total([elem | rest], acc), do: total(rest, acc + elem)

  def busy_days(list), do: busy_days(list, 0)
  defp busy_days([], acc), do: acc
  defp busy_days([elem | rest], acc) when elem >= 5, do: busy_days(rest, acc + 1)
  defp busy_days([elem | rest], acc), do: busy_days(rest, acc)
end
