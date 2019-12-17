defmodule Triage.Repo.Migrations.AddSymptomsTable do
  use Ecto.Migration

  def change do
    create table(:symptoms, primary_key: false) do
      add :id, :string, primary_key: true
      add :name, :string
      add :common_name, :string
      add :sex_filter, :string
      add :category, :string
      add :seriousness, :string
      add :location, :string

      timestamps()
    end
  end
end
