defmodule Triage.SymptomsControllerTest do
	use TriageWeb.ConnCase
	import Triage.Factory
  
	test "#index renders all symptoms" do
		symptoms = insert_pair(:symptom)
		conn = get(build_conn(), "/api/v1/symptoms")
    
	  assert json_response(conn, 200) == %{
		"data" => [
			%{"common_name" => List.first(symptoms).common_name, 
				"id" => List.first(symptoms).sid, 
				"location" => List.first(symptoms).location, 
				"name" => List.first(symptoms).name}, 
				%{"common_name" => List.last(symptoms).common_name, 
				"id" => List.last(symptoms).sid, 
				"location" => List.last(symptoms).location, 
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
				"name" => List.first(symptoms).name}, 
				%{"common_name" => List.last(symptoms).common_name, 
				"id" => List.last(symptoms).sid, 
				"location" => List.last(symptoms).location, 
				"name" => List.last(symptoms).name}
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
				"name" => symptom.name}
	}
	end
  end