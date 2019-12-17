defmodule Mix.Tasks.Import do
  use Mix.Task
  use Ecto.Schema
  alias Triage.Repo
  alias Triage.Condition

	@shortdoc "import symptoms and conditions to db"

	def run(_) do
	  {:ok, condition_data} = File.read("./priv/repo/raw_data/conditions.json")
    raw = Poison.decode!(condition_data)
    Enum.each(raw, fn condition -> 
      Triage.Condition.changeset(%Condition{}, %{cid: condition["id"], 
                                  name: condition["name"], 
                                  common_name: condition["common_name"],
                                  sex_filter: condition["sex_filter"],
                                  category: List.first(condition["categories"]),
                                  prevalence: condition["prevalence"],
                                  acuteness: condition["acuteness"],
                                  severity: condition["severity"],
                                  icd10_code: condition["extras"]["icd10_code"],
                                  hint: condition["extras"]["hint"],
                                  triage_level: condition["triage_level"]
                                  })
      |> Repo.insert
      |> IO.inspect
    end)
	end
end