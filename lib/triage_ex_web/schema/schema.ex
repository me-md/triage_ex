defmodule TriageWeb.Schema.Schema do
	use Absinthe.Schema
	use Absinthe.Ecto, repo: Triage.Repo
  
	query do
	  @desc "Get a list of symptoms"
    field :symptoms, list_of(:symptom) do
      arg :location, :string
      arg :search, :string
      resolve &TriageWeb.Resolvers.Symptom.symptoms/3
	  end
  
	  @desc "Get a symptom by its symptom_id"
	  field :symptom, :symptom do
		  arg :id, non_null(:string)
		  resolve &TriageWeb.Resolvers.Symptom.symptom_by_id/3
	  end
	end
  
	object :symptom do
	  field :sid, non_null(:string), name: "id"
	  field :name, non_null(:string)
	  field :common_name, non_null(:string)
	  field :location, non_null(:string)
	end
end