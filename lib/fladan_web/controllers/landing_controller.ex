defmodule FladanWeb.LandingController do
  use FladanWeb, :controller

  def home(conn, _params) do
    posts = Fladan.News.list_posts()
    render(conn, :home, posts: posts)
  end

  def archive(conn, _params) do
    posts = Fladan.News.list_posts()
    render(conn, :archive, posts: posts)
  end

  def show(conn, %{"slug" => slug}) do
    case Fladan.News.get_post_by_slug(slug) do
      nil ->
        conn
        |> put_flash(:error, "Post not found.")
        |> redirect(to: ~p"/")

      post ->
        render(conn, :show, post: post)
    end
  end
end
