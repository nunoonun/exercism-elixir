defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    [_ | rest] = list
    rest
  end

  def first(list) do
    [first | _] = list
    first
  end

  def count(list) do
    length(list)
  end

  def exciting_list?(list) do
    find_list("Elixir", list)
  end

  def find_list(_, []), do: false

  def find_list(item, [first | _]) when item == first, do: true

  def find_list(item, [_ | rest]) do
    find_list(item, rest)
  end
end
