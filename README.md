# Triage: Symptoms and Conditions

**Production URL: https://triage-ex.herokuapp.com/**

To start your Phoenix server locally:

  * Clone down this repo
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Upload symptoms db with mix task `mix symptoms`
  * Upload conditions db with mix task `mix conditions`
  * Upload risk factors db with mix task `mix risks`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## V1 REST Endpoints

  * `/api/v1/symptoms` -> returns all symptoms (including risk factors)
  * `/api/v1/risks` -> returns all risk factors
  * `/api/v1/symptoms?location=x` -> returns all symptoms on body location x
    * available bodyparts: ["abdomen", "undefined", "head", "back", "chest", "legs", "feet", "groin", "arms"]
  * `/api/v1/symptoms?search=x` -> searches symptom name, common_name and location for x
  * `/api/v1/symptoms?sex_filter=x` -> returns symptoms for each sex filter (male, female or both)
  * `/api/v1/symptoms/:id` -> returns single symptom with id
  * `/api/v1/conditions` -> returns all conditions
  * `/api/v1/conditions?search=x` -> searches condition name, common_name and category for x
  * `/api/v1/conditions/:id` -> returns single condition with id
  
## V2 GraphQL
**ALL** GraphQL requests are POST, with query in the request body.
### Endpoint -> `/api/v2`
### Interface -> `/api/v2/graphiql`

### GET conditions
**optional** search field will search the condition name, common_name and category for the specified term.
#### Sample body
  ```
  query 
  	{ conditions(search: "search_term")
		{ 
		 	id
			name
		  	common_name
     		sex_filter
		   	category
     		prevalence
		   	acuteness
		   	severity
		   	icd10_code
		   	hint
		   	triage_level
		  } 
  	}
  ```
#### sample response
```
  {
    "data": {
        "conditions": [
            {
                "acuteness": "chronic",
                "category": "Hypertensiology",
                "common_name": "Cough resulting from reaction to angiotensin-converting enzyme inhibitor drugs",
                "hint": "Your symptoms may result from used medication. Please report that symptom to your GP.",
                "icd10_code": "R05, T88.7, Y52.4",
                "id": "c_926",
                "name": "ACE inhibitor-induced cough",
                "prevalence": "very_rare",
                "severity": "mild",
                "sex_filter": "both",
                "triage_level": "consultation"
            },
            {
                "acuteness": "acute_potentially_chronic",
                "category": "Surgery",
                "common_name": "Abdominal aortic dissection",
                "hint": "You may require immediate medical attention, seek emergency care.",
                "icd10_code": "I71.0",
                "id": "c_885",
                "name": "Abdominal aortic dissection",
                "prevalence": "very_rare",
                "severity": "severe",
                "sex_filter": "both",
                "triage_level": "emergency"
            }
           ]
        }
    }
```
  
### GET symptoms
**optional** search field will search the symptom name and common_name for the specified term, **optional** location param will return symptoms in a specified location. -> ["abdomen", "undefined", "head", "back", "chest", "legs", "feet", "groin", "arms"]
#### Sample body:
  ```
  query 
	  { symptoms(search: "search_term", location: "search_location")
		  { 
		  	id
			name
		  	common_name
		  } 
  	}
  ```
 #### Sample Response:
 ```
 {
    "data": {
        "symptoms": [
            {
                "common_name": "Abdominal guarding",
                "id": "s_1558",
                "name": "Abdominal guarding"
            },
            {
                "common_name": "Lump in abdomen",
                "id": "s_299",
                "name": "Abdominal mass"
            },
            {
                "common_name": "Abdominal mass, after pregnancy or the removal of molar pregnancy",
                "id": "s_1293",
                "name": "Abdominal mass, after pregnancy or the removal of molar pregnancy"
            }
	 ]
     }
}
```

### GET risk_factors
**Risk Factors include a Question attribute**
#### Sample body:
  ```
  query 
	  { risks
		  { 
		  	id
			name
		  	common_name
		  	question
		  } 
  	}
  ```
 #### Sample Response:

  
  ## Testing
  run testing suite with `mix test --cover`
  
  ## Tech Stack

  * Elixir 1.9.1 (compiled with Erlang/OTP 22)
  * Phoenix 1.4.10
  * ExUnit
  * Absinthe
  * PostgreSQL
