
get '/set_lists/new' do
  @set_list = SetList.new
  @venues = Venue.all
  erb :"set_lists/new"
end

get '/set_lists/new/:id' do
  @sets = params['sets'].to_i
  @number_of_songs = params['songs'].to_i
  @songs = Song.all
  @venue = Venue.find_by_id(params['venue_id'])
  @set_list = SetList.find_by_id(params['id'])
  erb :"set_lists/new_list"
end

post '/set_lists/new/:id' do
  @set_list = SetList.find_by_id(params['id'])
  @set_list.create_set_item(params,params['id'])
  redirect to("set_lists/#{params['id']}")
end

post '/set_lists/new' do
  @sets = params['sets']
  @songs = params['songs']
  @venues = Venue.all

  #break this into a helper class?
  date_parts = params['date'].split("-")
  @date = Date.new(date_parts[0].to_i,date_parts[1].to_i,date_parts[2].to_i)
  
  @set_list = SetList.new(name: params['name'], performance_date: @date, venue_id: params['venue_id'])
  if @set_list.save
    redirect to("/set_lists/new/#{@set_list.id}?sets=#{@sets}&songs=#{@songs}")
  else
    erb :"set_lists/new"
  end
end

get '/set_lists/:id' do
  @set_list = SetList.find_by_id(params['id'])
  @set_items = SetItem.where(set_list_id: params['id'])
  erb :"set_lists/show"
end