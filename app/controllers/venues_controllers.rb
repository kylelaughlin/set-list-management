
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

get '/venues/:id' do
  @venue = Venue.find_by_id(params['id'])
  erb :"venues/show"
end

get '/venues/:id/edit' do
  @venue = Venue.find_by_id(params['id'])
  erb :"venues/edit"
end

get '/venues/:id/delete' do
  @venue = Venue.find_by_id(params['id'])
  @venue.prepare_destruction
  @venue.destroy
  redirect to("/venues")
end
