defmodule FladanWeb.LandingController do
  use FladanWeb, :controller

  def home(conn, _params) do
    posts = Fladan.Posts.list_posts()
    render(conn, :home, posts: posts)
  end
end
