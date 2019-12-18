defmodule Triage.Conditions.Conditions do
	import Ecto.Query, warn: false

  alias Triage.Repo
  alias Triage.Conditions.Condition

  def all do
    Repo.all(Condition)
  end

  def find_by_cid(cid) do
    Repo.get_by(Condition, cid: cid)
  end

  def search(string) do
    query = from c in "conditions",
    where: ilike(c.name, ^"%#{string}%"),
    or_where: ilike(c.common_name, ^"%#{string}%"),
    or_where: ilike(c.category, ^"%#{string}%"),
    select: %{cid: c.cid, name: c.name, common_name: c.common_name, sex_filter: c.sex_filter, category: c.category, prevalence: c.prevalence, acuteness: c.acuteness, severity: c.severity, icd10_code: c.icd10_code, hint: c.hint, triage_level: c.triage_level}

    Repo.all(query)
  end
  
end