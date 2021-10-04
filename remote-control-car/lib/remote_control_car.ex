defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, :battery_percentage, :distance_driven_in_meters]

  def new() do
    %RemoteControlCar{nickname: "none", battery_percentage: 100, distance_driven_in_meters: 0}
  end

  def new(nickname) do
    %{new() | nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance_driven_in_meters}) do
    "#{distance_driven_in_meters} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}), do: "Battery empty"
  def display_battery(%RemoteControlCar{battery_percentage: battery_percentage}) do
    "Battery at #{battery_percentage}%"
  end

  def drive(%RemoteControlCar{battery_percentage: 0} = remote_car), do: remote_car
  def drive(%RemoteControlCar{} = remote_car) do
    %{remote_car | distance_driven_in_meters: remote_car.distance_driven_in_meters + 20, battery_percentage: remote_car.battery_percentage - 1}
  end
end
