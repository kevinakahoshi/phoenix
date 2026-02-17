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
    <form phx-change="handle_change" id="name-form">
      <input type="text" name="name" value={@name} />
    </form>

    <p>Bool: {@bool}</p>
    <button phx-click="toggle_bool">Click Me</button>

    <p>Password</p>
    <%!-- <.form>
      <.input field={f[:password]} value={input_value(f[:password].value)} />
      <.input field={f[:password_confirmation]} value={input_value(f[:password_confirmation].value)} />
    </.form> --%>
    """
  end

  defp parse_temp(nil, fallback), do: fallback
  defp parse_temp(val, fallback) do
    case Integer.parse(val) do
      {n, _} -> n
      :error -> fallback
    end
  end

  def mount(params, _session, socket) do
    temperature =
      (params["temperature"] || params["temp"])
      |> parse_temp(70)
    name = ""
    bool = false

    password = ""
    password_confirmation = ""
    {
      :ok,
      assign(
        socket,
        temperature: temperature,
        name: name,
        bool: bool,
        password: password,
        password_confirmation: password_confirmation
      )
    }
  end

  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end

  def handle_event("desc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 - 1))}
  end

  def handle_event("handle_change", %{"name" => name} = params, socket) do
    {:noreply, assign(socket, name: name)}
  end

  def handle_event("toggle_bool", _params, socket) do
    {:noreply, update(socket, :bool, &(!&1))}
  end
end
