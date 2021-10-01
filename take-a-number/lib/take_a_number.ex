defmodule TakeANumber do
  def start(initial_state) do
    receive_loop(initial_state)
  end

  def receive_loop(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        receive_loop(state)
      {:take_a_number, sender_pid} ->
        new_state = state + 1
        send(sender_pid, new_state)
        receive_loop(new_state)
      :stop -> Process.exit(self(), "normal exit")
      _ ->
        receive_loop(state)
    end
  end

  def start() do
    spawn(TakeANumber, :start, [0])
  end
end
