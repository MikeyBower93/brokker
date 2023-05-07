defmodule BrokkerWeb.PageController do
  use BrokkerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
