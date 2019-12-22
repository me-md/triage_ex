defmodule Triage.Repo.Migrations.AddQuestionToSymptoms do
  use Ecto.Migration

  def change do
		alter table("symptoms") do
			add :question, :string
		end
  end
end
