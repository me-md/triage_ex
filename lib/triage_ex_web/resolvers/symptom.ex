defmodule TriageWeb.Resolvers.Symptom do
	alias Triage.Symptoms.Symptoms
  
  def symptoms(_, params, _) do
    case params do
      %{location: location} -> {:ok, Symptoms.get_symptoms_by_location(location)}
      %{search: search_term} -> {:ok, Symptoms.search(search_term)}
      _ -> {:ok, Symptoms.all}
    end
	end

	def symptom_by_id(_, %{id: sid}, _) do
	  {:ok, Symptoms.find_by_sid(sid)}
	end

	def risk_factors(_, _params, _) do
		{:ok, Symptoms.get_risk_factors}
	end
end