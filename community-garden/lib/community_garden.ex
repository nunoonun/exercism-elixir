# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start() do
    Agent.start(fn -> {0, []} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn {_, registrations} -> registrations end)
  end

  def register(pid, register_to) do
    last_id = Agent.get(pid, fn {last_id, _} -> last_id end)
    plot = %Plot{plot_id: last_id + 1, registered_to: register_to}
    Agent.update(pid, fn {_, registrations} -> {last_id + 1, registrations ++ [plot]} end)

    plot
  end

  def release(pid, plot_id) do
    registration =
      list_registrations(pid)
      |> Enum.find(&(&1.plot_id == plot_id))

    remove_registration(pid, registration)
  end

  defp remove_registration(_, nil), do: nil
  defp remove_registration(pid, registration) do
    Agent.update(pid, fn {id, registrations} ->
      {id, Enum.filter(registrations, &(&1.plot_id != registration.plot_id))}
    end)
    :ok
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn {_, registrations} ->
      render_registration(Enum.find(registrations, &(&1.plot_id == plot_id)))
    end)
  end

  defp render_registration(nil), do: {:not_found, "plot is unregistered"}
  defp render_registration(registration) do
    registration
  end
end
