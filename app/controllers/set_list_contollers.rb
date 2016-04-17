
get '/set_lists' do
  @set_lists = SetList.all
  erb :"set_lists/index"
end

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



post '/set_lists/new' do
  @sets = params['sets'].to_i
  @songs = params['songs'].to_i
  @venues = Venue.all

  #break this into a helper class?
  date_parts = params['date'].split("-")
  @date = Date.new(date_parts[0].to_i,date_parts[1].to_i,date_parts[2].to_i)

  @set_list = SetList.new(name: params['name'],
                          performance_date: @date,
                          venue_id: params['venue_id'],
                          number_of_sets: @sets,
                          songs_per_set: @songs)
  if @set_list.save
    redirect to("/set_lists/new/#{@set_list.id}?sets=#{@sets}&songs=#{@songs}")
  else
    erb :"set_lists/new"
  end
end

#Handle AJAX calls to delete and rewrite the set items associated with each set in a set_list
post '/set_lists/new/sets' do
  binding.pry
  @set_list = SetList.find_by_id(params['set_list_id'])
  @set_list.update_sets(params)
end

=begin
post '/set_lists/:id' do
  @set_list = SetList.find_by_id(params['id'])
  @set_list.create_set_item(params,params['id'])
  redirect to("set_lists/#{params['id']}")
end
=end

get '/set_lists/:id' do
  @set_list = SetList.find_by_id(params['id'])
  @set_items = SetItem.where(set_list_id: params['id'])
  erb :"set_lists/show"
end

get '/set_lists/:id/edit' do
  @set_list = SetList.find_by_id(params['id'])
  @set_items = SetItem.where(set_list_id: params['id'])
  @songs = Song.all
  erb :"set_lists/edit"
end

delete '/set_lists/:id/delete' do
  @set_list = SetList.find_by_id(params['id'])
  @set_items = SetItem.where(set_list_id: @set_list.id)
  @set_list.prepare_destruction(@set_items)
  @set_list.destroy
  redirect to("/set_lists")
end

get'/test' do
  @songs = Song.all
  erb :"set_lists/test"
end
