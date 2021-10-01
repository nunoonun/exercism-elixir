defmodule DateParser do
  def day() do
    "[0-9]{0,1}[1-9]{1}"
  end

  def month() do
    "[0-9]{0,1}[1-9]{1}"
  end

  def year() do
    "[0-9]{4}"
  end

  def day_names() do
    "(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)"
  end

  def month_names() do
    "(January|February|March|April|May|June|July|August|September|October|(Nov|Dec)ember)"
  end

  def capture_day() do
    "(?P<day>#{day()})"
  end

  def capture_month() do
    "(?P<month>#{month()})"
  end

  def capture_year() do
    "(?P<year>#{year()})"
  end

  def capture_day_name() do
    "(?P<day_name>#{day_names()})"
  end

  def capture_month_name() do
    "(?P<month_name>#{month_names()})"
  end

  def capture_numeric_date() do
    "#{capture_day()}/#{capture_month()}/#{capture_year()}"
  end

  def capture_month_name_date() do
    "#{capture_month_name()} #{capture_day()}, #{capture_year()}"
  end

  def capture_day_month_name_date() do
    "#{capture_day_name()}, #{capture_month_name()} #{capture_day()}, #{capture_year()}"
  end

  def match_numeric_date() do
    "^#{capture_numeric_date()}$"
    |> Regex.compile!()
  end

  def match_month_name_date() do
    "^#{capture_month_name_date()}$"
    |> Regex.compile!()
  end

  def match_day_month_name_date() do
    "^#{capture_day_month_name_date()}$"
    |> Regex.compile!()
  end
end
