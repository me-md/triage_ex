defmodule TriageWeb.Resolvers.Condition do
	alias Triage.Conditions.Conditions
  
  def conditions(_, params, _) do
    case params do
      %{search: search_term} -> {:ok, Conditions.search(search_term)}
      _ -> {:ok, Conditions.all}
    end
	end

	def condition_by_id(_, %{id: cid}, _) do
	  {:ok, Conditions.find_by_cid(cid)}
	end
end