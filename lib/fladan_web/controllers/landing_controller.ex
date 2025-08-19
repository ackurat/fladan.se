defmodule FladanWeb.LandingController do
  use FladanWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
