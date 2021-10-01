defmodule KitchenCalculator do
  def get_volume({_, quantity}), do: quantity

  def to_milliliter({:cup, quantity}), do: {:milliliter, quantity * 240.0}
  def to_milliliter({:fluid_ounce, quantity}), do: {:milliliter, quantity * 30.0}
  def to_milliliter({:teaspoon, quantity}), do: {:milliliter, quantity * 5.0}
  def to_milliliter({:tablespoon, quantity}), do: {:milliliter, quantity * 15.0}
  def to_milliliter({:milliliter, quantity}), do: {:milliliter, quantity}

  def from_milliliter({:milliliter, quantity}, :cup = unit), do: {unit, quantity / 240.0}
  def from_milliliter({:milliliter, quantity}, :fluid_ounce = unit), do: {unit, quantity / 30.0}
  def from_milliliter({:milliliter, quantity}, :teaspoon = unit), do: {unit, quantity / 5.0}
  def from_milliliter({:milliliter, quantity}, :tablespoon = unit), do: {unit, quantity / 15.0}
  def from_milliliter({:milliliter, quantity}, :milliliter = unit), do: {unit, quantity}

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
