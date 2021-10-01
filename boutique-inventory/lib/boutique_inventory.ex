defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort(&(&1.price <= &2.price))
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(&(&1.price == nil))
  end

  def increase_quantity(item, count) do
    new_quantities =
      item.quantity_by_size
      |> Enum.reduce(%{}, fn {k,v}, acc -> Map.put(acc, k, v + count) end)

    Map.put(item, :quantity_by_size, new_quantities)
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, fn {_k,v}, acc -> acc + v end)
  end
end
