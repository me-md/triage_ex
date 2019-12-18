defmodule Triage.Factory do
	use ExMachina.Ecto, repo: Triage.Repo
  
	def symptom_factory do
	  %Triage.Symptoms.Symptom{
		sid: sequence(:sid, &"s_#{&1}"),
        name: "Abdominal guarding",
        common_name: "Abdominal guarding",
        sex_filter: "both",
        seriousness: "emergency",
        location: "abdomen"
	  }
	end

	def condition_factory do
		%Triage.Conditions.Condition{
		  cid: sequence(:cid, &"c_#{&1}"),
		  name: "Evetteitus Larrypug",
		  common_name: "Evetteitus",
		  sex_filter: "both",
		  category: "Evetteology",
		  prevalence: "bad",
		  acuteness: "meh",
		  severity: "emergency",
		  icd10_code: "EVT",
		  hint: "BAD GET 2 DOC",
		  triage_level: "emergency"
		}
	  end
  end