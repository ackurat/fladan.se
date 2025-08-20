defmodule Fladan.Repo.Migrations.AddPostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :slug, :string, null: false
      add :content, :text, null: false
      add :published_at, :utc_datetime

      timestamps(default: fragment("now()"))
    end

    create unique_index(:posts, [:slug])
  end
end
