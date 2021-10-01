defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    split_path = String.split(path, ".")
    extract_from_path_list(data, split_path)
  end

  defp extract_from_path_list(data, []), do: data
  defp extract_from_path_list(nil, _), do: nil
  defp extract_from_path_list(data, [head | tail]) do
    extract_from_path_list(data[head], tail)
  end

  def get_in_path(data, path) do
    data
    |> Kernel.get_in(String.split(path, "."))
  end
end
