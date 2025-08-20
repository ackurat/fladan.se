defmodule FladanWeb.LandingController do
  use FladanWeb, :controller

  def home(conn, _params) do
    posts = Fladan.Posts.list_posts()
    render(conn, :home, posts: posts)
  end

  def show(conn, %{"slug" => slug}) do
    case Fladan.Posts.get_post(slug) do
      nil ->
        conn
        |> put_flash(:error, "Post not found.")
        |> redirect(to: ~p"/" )
      post ->
        render(conn, :show, post: post)
    end
  end
end
