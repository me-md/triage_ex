defmodule TriageWeb.SymptomsView do
	use TriageWeb, :view
  
	def render("index.json", %{symptoms: symptoms}) do
    %{data: render_many(symptoms, TriageWeb.SymptomsView, "symptom.json", as: :symptom)}
	end

	def render("riskindex.json", %{symptoms: symptoms}) do
    %{data: render_many(symptoms, TriageWeb.SymptomsView, "risk.json", as: :symptom)}
	end

  def render("show.json", %{symptom: symptom}) do
    %{data: render_one(symptom, TriageWeb.SymptomsView, "symptom.json", as: :symptom)}
  end

  def render("symptom.json", %{symptom: symptom}) do
		%{ id: symptom.sid,
			name: symptom.name,
			common_name: symptom.common_name,
			location: symptom.location,
			sex_filter: symptom.sex_filter
			}
	end

	def render("risk.json", %{symptom: symptom}) do
		%{ id: symptom.sid,
			name: symptom.name,
			common_name: symptom.common_name,
			question: symptom.question,
			location: symptom.location,
			sex_filter: symptom.sex_filter
			}
	end
end