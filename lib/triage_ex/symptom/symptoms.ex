defmodule Triage.Symptoms.Symptoms do
	import Ecto.Query, warn: false
  
  alias Triage.Repo
  alias Triage.Symptoms.Symptom

  def all do
    Repo.all(Symptom)
  end

  def find_by_sid(sid) do
    Repo.get_by(Symptom, sid: sid)
  end

  def get_symptoms_by_location(location) do
    query = from s in "symptoms",
    where: s.location == ^location,
    select: %{sid: s.sid, name: s.name, common_name: s.common_name, location: s.location, sex_filter: s.sex_filter}

    Repo.all(query)
	end

	def get_risk_factors do
		query = from s in "symptoms",
    where: s.category == "Risk factors",
    select: %{sid: s.sid, name: s.name, common_name: s.common_name, location: s.location, sex_filter: s.sex_filter}

    Repo.all(query)
	end
	
	def symptoms_by_gender(sex_filter) do
    query = from s in "symptoms",
    where: s.sex_filter == ^sex_filter,
    select: %{sid: s.sid, name: s.name, common_name: s.common_name, location: s.location, sex_filter: s.sex_filter}

    Repo.all(query)
  end

  def search(string) do
    query = from s in "symptoms",
    where: ilike(s.name, ^"%#{string}%"),
    or_where: ilike(s.common_name, ^"%#{string}%"),
    or_where: ilike(s.location, ^"%#{string}%"),
    select: %{sid: s.sid, name: s.name, common_name: s.common_name, location: s.location, sex_filter: s.sex_filter}

    Repo.all(query)
  end
  
end