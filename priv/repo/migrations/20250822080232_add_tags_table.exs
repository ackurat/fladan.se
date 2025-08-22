defmodule Fladan.Repo.Migrations.AddTagsTable do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :name, :string, null: false
      add :slug, :string, null: false
      timestamps(default: fragment("now()"))
    end

    create unique_index(:tags, [:slug])

    create table(:posts_tags, primary_key: false) do
      add :post_id, references(:posts)
      add :tag_id, references(:tags)
    end

    create unique_index(:posts_tags, [:post_id, :tag_id])
  end
end
