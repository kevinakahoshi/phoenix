defmodule HelloWeb.ThermostatLive do
  use HelloWeb, :live_view
  require Logger

  def render(assigns) do
    ~H"""
    Current temperature: {@temperature}°F
    <div>
      <button phx-click="inc_temperature">+</button>
      <button phx-click="desc_temperature">-</button>
    </div>

    <p>Name: {@name}</p>
    <.form phx-change="handle_change" id="name-form">
      <input type="text" name="name" value={@name} />
    </.form>
    """
  end

  def mount(_params, _session, socket) do
    temperature = 70 # Let's assume a fixed temperature for now
    name = ""
    {:ok, assign(socket, temperature: temperature, name: name)}
  end

  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end

  def handle_event("desc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 - 1))}
  end

  def handle_event("handle_change", %{"name" => name} = params, socket) do
    Logger.info("handle_change params: #{inspect(params)}")

    {:noreply, assign(socket, name: name)}
  end
end
