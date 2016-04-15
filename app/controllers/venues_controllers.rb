
get '/venues' do
  @venues = Venue.all
  erb :"venues/index"
end

get '/venues/new' do
  @venue = Venue.new
  erb :"venues/new"
end

post '/venues' do
  @venue = Venue.new(name: params['name'], address: params['address'])
  if @venue.save
    redirect to("/venues")
  else
    erb :"venues/new"
  end
end
