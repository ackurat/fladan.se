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

  def tags(conn, _params) do
    tags = Fladan.News.list_tags() |> Fladan.Repo.preload(:posts)
    render(conn, :tags, tags: tags)
  end

  def tag_show(conn, %{"slug" => slug}) do
    case Fladan.News.get_tag_by_slug(slug) do
      nil ->
        conn
        |> put_flash(:error, "Tag not found.")
        |> redirect(to: "/tags")

      tag ->
        posts = Fladan.News.get_posts_by_tag(tag)
        render(conn, :tag_show, tag: tag, posts: posts)
    end
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
