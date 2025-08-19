defmodule FladanWeb.PageController do
  use FladanWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
