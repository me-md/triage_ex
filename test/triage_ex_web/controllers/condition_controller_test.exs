defmodule Triage.ConditionsControllerTest do
	use TriageWeb.ConnCase
	import Triage.Factory
  
	test "#index renders all conditions" do
		conditions = insert_pair(:condition)
		conn = get(build_conn(), "/api/v1/conditions")
    
	  assert json_response(conn, 200) == %{
		"data" => [
			%{"id" => List.first(conditions).cid, 
			"common_name" => List.first(conditions).common_name, 
			"name" => List.first(conditions).name, 
			"acuteness" => List.first(conditions).acuteness, 
			"category" => List.first(conditions).category, 
			"hint" => List.first(conditions).hint, 
			"icd10_code" => List.first(conditions).icd10_code, 
			"prevalence" => List.first(conditions).prevalence, 
			"severity" => List.first(conditions).severity, 
			"sex_filter" => List.first(conditions).sex_filter, 
			"triage_level" => List.first(conditions).triage_level},
			%{"id" => List.last(conditions).cid, 
			"common_name" => List.last(conditions).common_name, 
			"name" => List.last(conditions).name, 
			"acuteness" => List.last(conditions).acuteness, 
			"category" => List.last(conditions).category, 
			"hint" => List.last(conditions).hint, 
			"icd10_code" => List.last(conditions).icd10_code, 
			"prevalence" => List.last(conditions).prevalence, 
			"severity" => List.last(conditions).severity, 
			"sex_filter" => List.last(conditions).sex_filter, 
			"triage_level" => List.last(conditions).triage_level}
		]
	}
	end
  
	test "#show renders a single condition" do
	  condition = insert(:condition)
	  conn = get(build_conn(), "/api/v1/conditions/#{condition.cid}")
    
	  assert json_response(conn, 200) == %{
		"data" =>
		%{"id" => condition.cid, 
		"common_name" => condition.common_name, 
		"name" => condition.name, 
		"acuteness" => condition.acuteness, 
		"category" => condition.category, 
		"hint" => condition.hint, 
		"icd10_code" => condition.icd10_code, 
		"prevalence" => condition.prevalence, 
		"severity" => condition.severity, 
		"sex_filter" => condition.sex_filter, 
		"triage_level" => condition.triage_level}
	}
	end
  end