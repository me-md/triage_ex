defmodule Mix.Tasks.Symptoms do
  use Mix.Task
  alias Triage.Repo
  alias Triage.Symptom

	@shortdoc "import symptoms to db"

  def run(_) do
    Mix.Task.run("app.start")
	  {:ok, symptom_data} = File.read("./priv/repo/raw_data/symptoms.json")
    raw = Poison.decode!(symptom_data)
    Enum.each(raw, fn symptom -> 
      Symptom.changeset(%Symptom{}, %{sid: symptom["id"], 
                                  name: symptom["name"], 
                                  common_name: symptom["common_name"],
                                  sex_filter: symptom["sex_filter"],
                                  seriousness: symptom["seriousness"],
                                  location: set_location(symptom["name"])
                                  })
      |> Repo.insert(returning: [:sid])
    end)
  end

  def set_location(name) do
    cond do
      String.contains?(name, ["chest", "breast", "cough", "heart", "heartburn", "breath", "breathing", "lung", "nipple"]) -> "Chest"
      String.contains?(name, ["abdomen", "abdominal", "stomach", "bladder", "stools", "flatus", "anus", "bowel", "buttocks", "urine", "diarrhea", "testicles", "urethra", "urination"]) -> "Abdomen"
      String.contains?(name, ["back", "kidney", "kidneys"]) -> "Back"
      String.contains?(name, ["vaginal", "penis", "genital", "crotch", "scrotum"]) -> "Groin"
      String.contains?(name, ["face", "facial", "neck", "jaw", "vision", "headache", "forehead", "head", "gums", "gum", "auditory", "nasal", "eyes", "ear", "earache", "throat", "thorax", "tounge", "mouth", "teeth", "tooth", "tonsil", "hearing", "sight", "visual", "voice", "see", "breath", "dental", "eyelid", "sensory", "lip", "nasal"]) -> "Head"
      String.contains?(name, ["arms", "elbow", "wrist"]) -> "Arms"
      String.contains?(name, ["hands", "fingers", "finger", "hand", "fingernail", "thumb", "thumbs"]) -> "Hands"
      String.contains?(name, ["legs", "knee", "shin", "calf", "thigh", "hips", "hip"]) -> "Legs"
      String.contains?(name, ["feet", "toes", "toe", "foot", "ankle", "toenail", "heel"]) -> "Feet"
      true -> "Undefined"
    end
  end
end