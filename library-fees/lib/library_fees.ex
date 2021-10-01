defmodule LibraryFees do
  def datetime_from_string(string) do
    with {:ok, datetime} <- NaiveDateTime.from_iso8601(string) do
      datetime
    else
      _ -> nil
    end
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    days_to_add = if before_noon?(checkout_datetime), do: 28, else: 29
    checkout_datetime
    |> NaiveDateTime.add(days_to_add*24*60*60, :second)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)

    if Date.diff(actual_return_date, planned_return_date) > 0 do
      Date.diff(actual_return_date,  planned_return_date)
    else
      0
    end
  end

  def monday?(datetime) do
    :calendar.day_of_the_week(datetime.year, datetime.month, datetime.day) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return_date = datetime_from_string(checkout) |> return_date()
    actual_return_date = datetime_from_string(return)

    if monday?(actual_return_date) do
      days_late(planned_return_date, actual_return_date) * rate * 0.5
      |> floor()
    else
      days_late(planned_return_date, actual_return_date) * rate
    end
  end
end
