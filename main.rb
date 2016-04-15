require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

Dir[File.dirname(__FILE__) + "/app/*/*.rb"].each { |file| require file}

set :views, Proc.new {File.join(root, "app/views/")}
enable :method_override

get "/" do
  @set_lists = SetList.order("performance_date").limit(5)
  erb :home
end

get "/pry" do
  binding.pry
  redirect to("/")
end
