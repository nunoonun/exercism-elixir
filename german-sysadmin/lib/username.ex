defmodule Username do
  def sanitize(username) do
    username
    |> Enum.map(&convert_character/1)
    |> List.flatten()
    |> Enum.map(&filter_character/1)
    |> Enum.filter(&(&1 != nil))
  end

  defp filter_character(char) do
    case char do
      ?_ -> char
      char when char >= ?a and char <= ?z -> char
      true -> nil
    end
  end

  defp convert_character(char) do
    case char do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      _ -> char
    end
  end
end
