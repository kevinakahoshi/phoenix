defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def count(conn, _params) do
    render(conn, :count)
  end

  def list(conn, _params) do
    nums = [1, 2, 3, 4, 5]

    conn
    |> assign(:nums, nums)
    |> render(:list)
  end

  def conditional(conn, _params) do
    condition = 5 > 3

    conn
    |> assign(:condition, condition)
    |> render(:conditional)
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
