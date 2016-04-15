
get '/venues' do
  @venues = Venue.all
  erb :"venues/index"
end

get '/venues/new' do
  @venue = Venue.new
  erb :"venues/new"
end
