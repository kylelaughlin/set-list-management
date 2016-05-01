require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

Dir[File.dirname(__FILE__) + "/app/*/*.rb"].each { |file| require file}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/set-list-manager')

set :views, Proc.new {File.join(root, "app/views/")}
enable :method_override

get "/" do
  @set_lists = SetList.where("performance_date > ?", Date.today).order("performance_date").limit(10)
  erb :home
end

get "/test" do
  @songs = Song.all
  erb :"set_lists/test"
end

get "/pry" do
  binding.pry
end
