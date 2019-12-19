# Triage: Symptoms and Conditions

**Production URL: https://triage-ex.herokuapp.com/**

To start your Phoenix server locally:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Upload symptoms db with mix task `mix symptoms`
  * Upload conditions db with mix task `mix conditions`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## V1 REST Endpoints

  * `/api/v1/symptoms` -> returns all symptoms
  * `/api/v1/symptoms?location=x` -> returns all symptoms on body location x
    * available bodyparts: ["abdomen", "undefined", "head", "back", "chest", "legs", "feet", "groin", "arms"]
  * `/api/v1/symptoms?search=x` searches symptom name, common_name and location for x
  * `/api/v1/symptoms/:id` -> returns single symptom with id
  * `/api/v1/conditions` -> returns all conditions
  * `/api/v1/conditions?search=x` searches condition name, common_name and category for x
  * `/api/v1/conditions/:id` -> returns single condition with id
  
## V2 GraphQL
Conditions: **optional** search field will search the condition name, common_name and category for the specified term.
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
  
  Symptoms: **optional** search field will search the symptom name for the specified term, **optional** location param will return symptoms in a specified location. -> ["abdomen", "undefined", "head", "back", "chest", "legs", "feet", "groin", "arms"]
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
  
  ## Testing
  run testing suite with `mix test`
