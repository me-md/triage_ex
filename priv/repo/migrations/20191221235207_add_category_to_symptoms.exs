defmodule Triage.Repo.Migrations.AddCategoryToSymptoms do
  use Ecto.Migration

  def change do
		alter table("symptoms") do
				add :category, :string
		end
  end
end
