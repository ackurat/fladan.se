defmodule Fladan.Posts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :content, :string
    field :published_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :slug, :content, :published_at])
    |> validate_required([:title, :slug, :content])
  end

  def list_posts do
    Fladan.Repo.all(Fladan.Posts)
  end
end
