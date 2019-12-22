defmodule Triage.ConditionsResolverTest do
	use TriageWeb.ConnCase
	import Triage.Factory
	use ExUnit.Case, async: true
	import Absinthe.Resolution.Helpers
	alias Triage.AbsintheHelper
	use Plug.Test

	test "#index renders all conditions", context do
		conditions = insert_pair(:condition)
		query = """
        {
          conditions {
						id
						name
						common_name
						acuteness
						category
						hint
						icd10_code
						prevalence
						severity
						sex_filter
						triage_level
          }
        }
			"""
			
			res = context.conn
			|> get("/api/v2", AbsintheHelper.query_skeleton(query, "conditions"))

			assert json_response(res, 200)["data"]["conditions"] == [
				%{
					"acuteness" => "meh",
					"category" => "Evetteology",
					"common_name" => "Evetteitus",
					"hint" => "BAD GET 2 DOC",
					"icd10_code" => "EVT",
					"id" => "c_5",
					"name" => "Evetteitus Larrypug",
					"prevalence" => "bad",
					"severity" => "emergency",
					"sex_filter" => "both",
					"triage_level" => "emergency"
				},
				%{
					"acuteness" => "meh",
					"category" => "Evetteology",
					"common_name" => "Evetteitus",
					"hint" => "BAD GET 2 DOC",
					"icd10_code" => "EVT",
					"id" => "c_6",
					"name" => "Evetteitus Larrypug",
					"prevalence" => "bad",
					"severity" => "emergency",
					"sex_filter" => "both",
					"triage_level" => "emergency"
				}
			]
			
	end
end