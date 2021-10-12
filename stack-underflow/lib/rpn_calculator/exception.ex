defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    def exception(term) do
      case term do
        [] -> %StackUnderflowError{}
        _ -> %StackUnderflowError{message: "stack underflow occurred, context: " <> term}
      end
    end
  end

  def divide(stack) when length(stack) < 2, do: raise StackUnderflowError, "when dividing"
  def divide([0 | _]), do: raise DivisionByZeroError
  def divide(stack), do: divide_rec(stack)

  def divide_rec([result]), do: result
  def divide_rec(stack) do
    {first, rem} = List.pop_at(stack, length(stack) - 1)
    {second, rem} = List.pop_at(rem, length(rem) - 1)
    divide_rec(rem ++ [first / second])
  end
end
