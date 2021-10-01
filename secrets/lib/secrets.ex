use Bitwise

defmodule Secrets do
  def secret_add(secret) do
    &(&1 + secret)
  end

  def secret_subtract(secret) do
    &(&1 - secret)
  end

  def secret_multiply(secret) do
    &(trunc(&1 * secret))
  end

  def secret_divide(secret) do
    &(trunc(&1 / secret))
  end

  def secret_and(secret) do
    &(band(secret, &1))
  end

  def secret_xor(secret) do
    &(bxor(secret, &1))
  end

  def secret_combine(secret_function1, secret_function2) do
    fn arg ->
      first = secret_function1.(arg)
      secret_function2.(first)
    end
  end
end
