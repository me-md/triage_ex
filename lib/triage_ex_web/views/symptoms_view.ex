defmodule TriageWeb.SymptomsView do
	use TriageWeb, :view
  
	def render("index.json", %{symptoms: symptoms}) do
	  %{
		symptoms: Enum.map(symptoms, &symptom_json/1)
	  }
	end
  
	def symptom_json(symptom) do
	  %{
		id: symptom.sid,
		name: symptom.name,
		common_name: symptom.common_name,
		location: symptom.location
	  }
	end
  end