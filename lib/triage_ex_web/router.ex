defmodule TriageWeb.Router do
  use TriageWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TriageWeb do
    pipe_through :api
  end
end
