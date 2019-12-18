# Triage

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Endpoints

  * `/api/v1/symptoms` -> returns all symptoms
  * `/api/v1/symptoms?location=x` -> returns all symptoms on body location x
  * `/api/v1/symptoms/:id` -> returns single symptom with id
