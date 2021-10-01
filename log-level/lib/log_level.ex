defmodule LogLevel do

  def to_label(0, false), do: :trace
  def to_label(1, _), do: :debug
  def to_label(2, _), do: :info
  def to_label(3, _), do: :warning
  def to_label(4, _), do: :error
  def to_label(5, false), do: :fatal
  def to_label(_, _), do: :unknown

  def alert_recipient(:error, _), do: :ops
  def alert_recipient(:fatal, _), do: :ops
  def alert_recipient(:unknown, true), do: :dev1
  def alert_recipient(:unknown, false), do: :dev2
  def alert_recipient(level, _) when is_atom(level), do: false

  def alert_recipient(level, legacy?) when not is_atom(level) do
    alert_recipient(to_label(level, legacy?), legacy?)
  end
end
