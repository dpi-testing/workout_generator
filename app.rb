require "sinatra"
require "sinatra/reloader"

get("/") do
 erb(:home)
end

get("/targeted_workouts") do
"hello"
erb(:targeted)
end

get("/random_workouts") do

erb(:random)
end
