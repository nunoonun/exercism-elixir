defmodule GuessingGame do

  def compare(_, guess \\ :no_guess) when not is_number(guess), do: "Make a guess"
  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when abs(secret_number - guess) <= 1.0, do: "So close"
  def compare(secret_number, guess) when secret_number - guess <= 0.0, do: "Too high"
  def compare(secret_number, guess) when secret_number - guess >= 0.0, do: "Too low"
end
