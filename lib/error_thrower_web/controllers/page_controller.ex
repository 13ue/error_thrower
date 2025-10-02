defmodule ErrorThrowerWeb.PageController do
  use ErrorThrowerWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
