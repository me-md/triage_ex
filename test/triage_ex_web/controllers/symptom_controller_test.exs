defmodule Triage.SymptomsControllerTest do
	use TriageWeb.ConnCase
	import Triage.Factory
  
	test "#index renders all symptoms", %{conn: conn} do
		symptoms = insert_pair(:symptom)
		conn = get(conn, "/api/v1/symptoms")
    
	  assert json_response(conn, 200) == %{
		"data" => [
			%{"common_name" => "Abdominal guarding", 
				"id" => "#{List.first(symptoms).sid}", 
				"location" => "abdomen", 
				"name" => "Abdominal guarding"}, 
				%{"common_name" => "Abdominal guarding", 
				"id" => "#{List.last(symptoms).sid}", 
				"location" => "abdomen", 
				"name" => "Abdominal guarding"}
		]
	}
	end

	test "#index with location param renders all symptoms in that location", %{conn: conn} do
		symptoms = insert_pair(:symptom)
		conn = get(conn, "/api/v1/symptoms?location=abdomen")
    
	  assert json_response(conn, 200) == %{
		"data" => [
			%{"common_name" => "Abdominal guarding", 
				"id" => "#{List.first(symptoms).sid}", 
				"location" => "abdomen", 
				"name" => "Abdominal guarding"}, 
				%{"common_name" => "Abdominal guarding", 
				"id" => "#{List.last(symptoms).sid}", 
				"location" => "abdomen", 
				"name" => "Abdominal guarding"}
		]
	}
	end

	test "#index with location param renders 0 symptoms in that location if there are none", %{conn: conn} do
		symptoms = insert_pair(:symptom)
		conn = get(conn, "/api/v1/symptoms?location=head")
    
	  assert json_response(conn, 200) == %{
		"data" => [

		]
	}
	end
  
	test "#show renders a single symptom" do
	  symptom = insert(:symptom)
	  conn = get(conn, "/api/v1/symptoms/#{symptom.sid}")
    
	  assert json_response(conn, 200) == %{
		"data" =>
			%{"common_name" => "Abdominal guarding", 
				"id" => "#{symptom.sid}", 
				"location" => "abdomen", 
				"name" => "Abdominal guarding"}
	}
	end
  end