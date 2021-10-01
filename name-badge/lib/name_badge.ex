defmodule NameBadge do
  def print(nil, name, department) do
    if department == nil do
      "#{name} - OWNER"
    else
      "#{name} - #{String.upcase(department)}"
    end
  end

  def print(id, name, department) do
    if department == nil do
      "[#{id}] - #{name} - OWNER"
    else
      "[#{id}] - #{name} - #{String.upcase(department)}"
    end
  end
end
