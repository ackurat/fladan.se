defmodule Fladan.News.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  alias Fladan.News.Post

  schema "tags" do
    field :name, :string
    field :slug, :string

    many_to_many :posts, Post, join_through: "posts_tags"

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name, :slug])
    |> validate_required([:name, :slug])
    |> unique_constraint(:slug)
  end
end
