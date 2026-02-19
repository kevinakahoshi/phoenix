defmodule HelloWeb.ThermostatController do
  use HelloWeb, :controller

  def show(conn, %{"initial_temp" => initial_temp}) do
    conn
    |> assign(:initial_temp, initial_temp)
    |> render(:show)
  end
end
