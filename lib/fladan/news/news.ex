defmodule Fladan.News do
  @moduledoc """
  The News context.
  """

  import Ecto.Query, warn: false
  alias Fladan.Repo
  alias Fladan.News.Post
  alias Fladan.News.Tag

  @doc """
  Returns the list of posts.
  """
  def list_posts do
    Repo.all(Post) |> Repo.preload(:tags)
  end

  @doc """
  Gets a single post by slug.
  """
  def get_post_by_slug(slug) do
    Repo.get_by(Post, slug: slug) |> Repo.preload(:tags)
  end

  @doc """
  Gets a single post.
  """
  def get_post!(id) do
    Repo.get!(Post, id) |> Repo.preload(:tags)
  end

  @doc """
  Creates a post.
  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.
  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.
  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns the list of tags.
  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Gets a single tag.
  """
  def get_tag!(id) do
    Repo.get!(Tag, id)
  end

  @doc """
  Creates a tag.
  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tag.
  """
  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tag.
  """
  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end
end
