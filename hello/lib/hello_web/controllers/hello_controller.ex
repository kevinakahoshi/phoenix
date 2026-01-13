defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"messenger" => messenger}) do
    conn
    |> assign(:messenger, messenger)
    |> assign(:receiver, "Dweezil")
    |> render(:show)
  end

  def boop(conn, %{"message" => message}) do
    text(conn, "Message: #{message}")
  end

  def beep(conn, %{"input" => input}) do
    json(conn, %{input: input, boop: "beep"})
  end
end
