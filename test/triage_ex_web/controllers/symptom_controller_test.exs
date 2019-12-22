defmodule Triage.SymptomsControllerTest do
	use TriageWeb.ConnCase
	import Triage.Factory
	alias Triage.Repo
  alias Triage.Symptoms.Symptom
  
	test "#index renders all symptoms" do
		symptoms = insert_pair(:symptom)
		conn = get(build_conn(), "/api/v1/symptoms")
    
	  assert json_response(conn, 200) == %{
		"data" => [
			%{"common_name" => List.first(symptoms).common_name, 
				"id" => List.first(symptoms).sid, 
				"location" => List.first(symptoms).location,
				"sex_filter" => List.first(symptoms).sex_filter, 
				"name" => List.first(symptoms).name}, 
				%{"common_name" => List.last(symptoms).common_name, 
				"id" => List.last(symptoms).sid, 
				"location" => List.last(symptoms).location,
				"sex_filter" => List.last(symptoms).sex_filter, 
				"name" => List.last(symptoms).name}
		]
	}
	end

	test "#index with location param renders all symptoms in that location" do
		symptoms = insert_pair(:symptom)
		conn = get(build_conn(), "/api/v1/symptoms?location=abdomen")
    
	  assert json_response(conn, 200) == %{
		"data" => [
			%{"common_name" => List.first(symptoms).common_name, 
				"id" => List.first(symptoms).sid, 
				"location" => List.first(symptoms).location,
				"sex_filter" => List.first(symptoms).sex_filter, 
				"name" => List.first(symptoms).name}, 
				%{"common_name" => List.last(symptoms).common_name, 
				"id" => List.last(symptoms).sid, 
				"location" => List.last(symptoms).location,
				"sex_filter" => List.last(symptoms).sex_filter, 
				"name" => List.last(symptoms).name}
		]
	}
	end

	test "#index with search param renders all symptoms that match search" do
		symptoms = insert_pair(:symptom)
		conn = get(build_conn(), "/api/v1/symptoms?search=abdomen")
    
	  assert json_response(conn, 200) == %{
		"data" => [
			%{"common_name" => List.first(symptoms).common_name, 
				"id" => List.first(symptoms).sid, 
				"location" => List.first(symptoms).location,
				"sex_filter" => List.first(symptoms).sex_filter, 
				"name" => List.first(symptoms).name}, 
				%{"common_name" => List.last(symptoms).common_name, 
				"id" => List.last(symptoms).sid, 
				"location" => List.last(symptoms).location,
				"sex_filter" => List.last(symptoms).sex_filter, 
				"name" => List.last(symptoms).name}
		]
	}
	end

	test "#index with sex_filter param renders all symptoms that match sex_filter" do
		symptoms = insert_pair(:symptom)
		conn = get(build_conn(), "/api/v1/symptoms?sex_filter=both")
    
	  assert json_response(conn, 200) == %{
		"data" => [
			%{"common_name" => List.first(symptoms).common_name, 
				"id" => List.first(symptoms).sid,
				"location" => List.first(symptoms).location,
				"sex_filter" => List.first(symptoms).sex_filter, 
				"name" => List.first(symptoms).name}, 
				%{"common_name" => List.last(symptoms).common_name, 
				"id" => List.last(symptoms).sid, 
				"location" => List.last(symptoms).location,
				"sex_filter" => List.last(symptoms).sex_filter, 
				"name" => List.last(symptoms).name}
		]
	}
	end

	test "#risks show the pre_conditions" do
		Symptom.changeset(%Symptom{}, %{sid: "p_7", 
																name: "evetteitus", 
																common_name: "evetteitus maximus",
																category: "riskay",
																question: "do u have evetteitus?",
																sex_filter: "both",
																seriousness: "v srs",
																location: "errrywhere"
																})
		|> Repo.insert(returning: [:sid])

		conn = get(build_conn(), "/api/v1/risks")
    
	  assert json_response(conn, 200) == %{
		"data" => [
			%{"common_name" => "evetteitus maximus", 
			"id" => "p_7", 
			"location" => "errrywhere",
			"question" => "do u have evetteitus?",
			"name" => "evetteitus", 
			"sex_filter" => "both"}
		]
	}
	end

	test "#index with location param renders 0 symptoms in that location if there are none" do
		insert_pair(:symptom)
		conn = get(build_conn(), "/api/v1/symptoms?location=head")
    
	  assert json_response(conn, 200) == %{
		"data" => [

		]
	}
	end
  
	test "#show renders a single symptom" do
	  symptom = insert(:symptom)
	  conn = get(build_conn(), "/api/v1/symptoms/#{symptom.sid}")
    
	  assert json_response(conn, 200) == %{
		"data" =>
			%{"common_name" => symptom.common_name, 
				"id" => symptom.sid, 
				"location" => symptom.location,
				"sex_filter" => symptom.sex_filter, 
				"name" => symptom.name}
	}
	end
end