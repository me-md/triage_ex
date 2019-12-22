defmodule TriageWeb.SymptomsController do
	use TriageWeb, :controller
	alias Triage.Symptoms.Symptoms

	action_fallback Triage.FallbackController

	def index(conn, params) do
		cond do
			params["location"] -> render conn, "index.json", symptoms: Symptoms.get_symptoms_by_location(params["location"])
			params["search"] -> render conn, "index.json", symptoms: Symptoms.search(params["search"])
			params["sex_filter"] -> render conn, "index.json", symptoms: Symptoms.symptoms_by_gender(params["sex_filter"])
			true -> render conn, "index.json", symptoms: Symptoms.all
		end
	end

	def risks(conn, _params) do
		render conn, "index.json", symptoms: Symptoms.get_risk_factors
	end

	def show(conn, %{"id" => sid}) do
		render conn, "show.json", symptom: Symptoms.find_by_sid(sid)
	end

end