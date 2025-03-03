require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
  erb(:index)
end
#testing

get("/random_workouts") do
  categories = [
    "abdominals",
    "abductors",
    "adductors",
    "biceps",
    "calves",
    "chest",
    "forearms",
    "glutes",
    "hamstrings",
    "lats",
    "lower_back",
    "middle_back",
    "neck",
    "quadriceps",
    "traps",
    "triceps",
  ].sample

  uri = "https://api.api-ninjas.com/v1/exercises?muscle=#{categories}"

  api_key = ENV["API_KEY"].to_s.gsub("\n", "").strip

  response = HTTP.headers("X-Api-Key" => api_key).get(uri)

  workouts = JSON.parse(response.to_s)
  if workouts.any?
    workout = workouts.first

    @workout_details = "Name: #{workout["name"]}\nType: #{workout["type"]}\nMuscle: #{workout["muscle"]}\nEquipment: #{workout["equipment"]}\nDifficulty: #{workout["difficulty"]}\nInstructions: #{workout["instructions"]}"
  end
  @workouts = workouts
  erb(:random)
end
