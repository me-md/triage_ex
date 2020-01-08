defmodule Triage.SymptomssResolverTest do
	use TriageWeb.ConnCase
	import Triage.Factory
	use ExUnit.Case, async: true
	alias Triage.AbsintheHelper
	use Plug.Test

	test "#index renders all symptoms", context do
		insert_pair(:symptom)
		query = """
        {
          symptoms {
						id
						name
						common_name
          }
        }
			"""
			
			res = context.conn
			|> get("/api/v2", AbsintheHelper.query_skeleton(query, "symptoms"))

			assert json_response(res, 200)["data"]["symptoms"] == [
				%{"common_name" => "Abdominal guarding", 
				"id" => "s_11", 
				"name" => "Abdominal guarding"}, 
				%{"common_name" => "Abdominal guarding", 
				"id" => "s_12", 
				"name" => "Abdominal guarding"}
			]
			
	end
end