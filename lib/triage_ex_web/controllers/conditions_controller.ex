defmodule TriageWeb.ConditionsController do
	use TriageWeb, :controller
	alias Triage.Conditions.Conditions

	action_fallback Triage.FallbackController

	def index(conn, params) do
		cond do
			params["search"] -> render conn, "index.json", conditions: Conditions.search(params["search"])
			true -> render conn, "index.json", conditions: Conditions.all
		end
	end

	def show(conn, %{"id" => cid}) do
		render conn, "show.json", condition: Conditions.find_by_cid(cid)
	end

end