defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    # render(conn, :home)
    # send_resp(conn, 201, "")
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(201, "")
  end
end
