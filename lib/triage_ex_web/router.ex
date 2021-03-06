defmodule TriageWeb.Router do
  use TriageWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", TriageWeb do
    pipe_through :api
			get "/symptoms", SymptomsController, :index
			get "/risks", SymptomsController, :risks
      get "/symptoms/:id", SymptomsController, :show
      get "/conditions", ConditionsController, :index
      get "/conditions/:id", ConditionsController, :show
  end

  scope "/api/v2" do
    pipe_through :api
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: Triage.Schema,
      interface: :simple

    forward "/", Absinthe.Plug,
      schema: Triage.Schema
  end
end
