defmodule HelloWeb.ThermostatLive do
  use HelloWeb, :live_view

  def render(assigns) do
    ~H"""
    Current temperature: {@temperature}°F
    <div>
      <button phx-click="inc_temperature">+</button>
      <button phx-click="desc_temperature">-</button>
    </div>

    <%!-- Name: {@name} --%>
    <input phx-change="name_change" />
    """
  end

  def mount(_params, _session, socket) do
    temperature = 70 # Let's assume a fixed temperature for now
    name = ""
    {:ok, assign(socket, :temperature, temperature)}
  end

  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end

  def handle_event("desc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 - 1))}
  end

  def handle_event("name_change", _params, socket) do
    value = &(&1)
    Logger.info(value)
    {:noreply, update(socket, :name, value)}
  end
end
