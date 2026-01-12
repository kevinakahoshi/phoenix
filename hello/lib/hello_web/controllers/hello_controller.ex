defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"messenger" => messenger}) do
    # render(conn, :show, messenger: messenger)
    # text(conn, "From messenger #{messenger}")
    json(conn, %{id: messenger})
  end

  def boop(conn, %{"message" => message}) do
    text(conn, "Message: #{message}")
  end

  def beep(conn, %{"input" => input}) do
    json(conn, %{input: input, boop: "beep"})
  end
end
