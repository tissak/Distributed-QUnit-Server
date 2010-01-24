require 'rubygems'
require 'sinatra'
require 'json'

enable :sessions
disable :logging, :dump_errors
mime :json, "application/json"

# Helper functions

def inc_state
  state = File.read("state.txt").to_i
  new_state = state + 1
  File.open("state.txt", "w") do |f|
    f.puts(new_state)
  end
end

def read_state
  File.read("state.txt").to_i
end

# Routes

post "/results" do
  results = params[:results]
  puts "All: #{results[:all]}, Failed: #{results[:fail]} from #{request.user_agent}" 
end

get "/state" do
  content_type :json
  s = {:state=>read_state}
  s.to_json
end

get "/trigger" do
  inc_state
end
