defmodule Fladan.Posts do
  use Ecto.Schema
  import Ecto.Changeset

  alias Fladan.Tags.Tag

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :content, :string
    field :published_at, :utc_datetime

    many_to_many :tags, Tag, join_through: "posts_tags"

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :slug, :content, :published_at])
    |> validate_required([:title, :slug, :content])
  end

  def list_posts do
    Fladan.Repo.all(Fladan.Posts) |> Fladan.Repo.preload(:tags)
  end

  def get_post(slug) do
    Fladan.Repo.get_by(Fladan.Posts, slug: slug) |> Fladan.Repo.preload(:tags)
  end
end
