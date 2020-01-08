defmodule Triage.Schema do
	use Absinthe.Schema
	use Absinthe.Ecto, repo: Triage.Repo
  
	query do
	  @desc "Get a list of all symptoms"
    field :symptoms, list_of(:symptom) do
      arg :location, :string
      arg :search, :string
      resolve &TriageWeb.Resolvers.Symptom.symptoms/3
		end
		
		@desc "Get a list of risk factors"
    field :risks, list_of(:symptom) do
      resolve &TriageWeb.Resolvers.Symptom.risk_factors/3
	  end
  
	  @desc "Get a symptom by its id"
	  field :symptom, :symptom do
		  arg :id, non_null(:string)
		  resolve &TriageWeb.Resolvers.Symptom.symptom_by_id/3
    end
    
    @desc "Get a list of conditions"
    field :conditions, list_of(:condition) do
      arg :search, :string
      resolve &TriageWeb.Resolvers.Condition.conditions/3
	  end
  
	  @desc "Get a condition by its id"
	  field :condition, :condition do
		  arg :id, non_null(:string)
		  resolve &TriageWeb.Resolvers.Condition.condition_by_id/3
	  end
	end
  
	object :symptom do
	  field :sid, non_null(:string), name: "id"
	  field :name, non_null(:string)
		field :common_name, non_null(:string)
		field :question, non_null(:string)
	  field :location, non_null(:string)
  end
  
  object :condition do
	  field :cid, non_null(:string), name: "id"
	  field :name, non_null(:string)
	  field :common_name, non_null(:string)
    field :sex_filter, non_null(:string)
		field :category, non_null(:string)
		field :prevalence, non_null(:string)
		field :acuteness, non_null(:string)
		field :severity, non_null(:string)
		field :icd10_code, non_null(:string)
		field :hint, non_null(:string)
		field :triage_level, non_null(:string)
	end
end