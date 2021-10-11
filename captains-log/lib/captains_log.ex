defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    number = :rand.uniform(8999) + 1000
    "NCC-#{number}"
  end

  def random_stardate() do
    new_stardate = :rand.uniform_real() * 1000.0
    new_stardate + 41000.0
  end

  def format_stardate(stardate) when is_float(stardate) do
    :io_lib.format("~.1f", [stardate])
    |> List.to_string()
  end
  def format_stardate(_), do: raise ArgumentError, message: "Stardate needs to be a float"
end
