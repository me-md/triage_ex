defmodule TriageWeb.SymptomsController do
	use TriageWeb, :controller
	alias Triage.Repo
	alias Triage.Symptom

	def index(conn, _params) do
		symptoms = Repo.all(Symptom)
	
		render conn, "index.json", symptoms: symptoms
	end
end