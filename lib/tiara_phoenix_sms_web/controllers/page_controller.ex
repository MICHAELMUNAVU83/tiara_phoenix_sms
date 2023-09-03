defmodule TiaraPhoenixSmsWeb.PageController do
  use TiaraPhoenixSmsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
