#index
get '/set_lists/?' do
  @set_lists_upcoming = SetList.where("performance_date >= ?", Date.today).order("performance_date")
  @set_lists_past = SetList.where("performance_date < ?", Date.today).order("performance_date")
  erb :"set_lists/index"
end

#new 1 of 2
get '/set_lists/new' do
  @set_list = SetList.new
  if @set_list.save
    redirect to("/set_lists/new/#{@set_list.id}")
  else
    redirect to("/set_lists")
  end
end

#new 2 of 2
get '/set_lists/new/:id' do
  @songs = Song.where.not(id: 1).order('title')
  @set_list = SetList.find_by_id(params['id'])
  erb :"set_lists/new"
end

post '/set_lists/new' do
  @venue = params['venue']
  @performance_date = params['performance_date']
  @set_list = SetList.find_by_id(params['set_list_id'].to_i)
  if @set_list.update_attributes(venue: @venue, performance_date: @performance_date)
    redirect to("/")
  else

  end
end
#dont need this post request
#create set list object record
post '/set_lists/new---old' do
  @sets = params['sets'].to_i
  @venues = Venue.where.not(id: 1)
  date_parts = params['date'].split("-")
  @date = Date.new(date_parts[0].to_i,date_parts[1].to_i,date_parts[2].to_i)
  @set_list = SetList.new(name: params['name'],
                          performance_date: @date,
                          venue_id: params['venue_id'],
                          number_of_sets: @sets)
  if @set_list.save
    redirect to("/set_lists/new/#{@set_list.id}?sets=#{@sets}")
  else
    erb :"set_lists/new"
  end
end

#Handle AJAX calls to delete and rewrite the set items associated with each set in a set_list
post '/set_lists/new/sets' do
  @set_list = SetList.find_by_id(params['set_list_id'])
  @set_list.update_sets(params)
end

#show
get '/set_lists/:id' do
  @set_list = SetList.find_by_id(params['id'])
  @set_1_songs = @set_list.set_items.includes(:song).where(set: 1).order(order: :desc)
  @set_2_songs = @set_list.set_items.includes(:song).where(set: 2).order(order: :desc)
  @set_3_songs = @set_list.set_items.includes(:song).where(set: 3).order(order: :desc)
  @set_4_songs = @set_list.set_items.includes(:song).where(set: 4).order(order: :desc)
  erb :"set_lists/show"
end

#edit
get '/set_lists/:id/edit' do
  @set_list = SetList.find_by_id(params['id'])
  @set_items = SetItem.where(set_list_id: params['id'])
  @songs = @set_list.available_songs(@set_items)
  erb :"set_lists/edit"
end

#delete
get '/set_lists/:id/delete' do
  @set_list = SetList.find_by_id(params['id'])
  @set_items = SetItem.where(set_list_id: @set_list.id)
  @set_list.prepare_destruction(@set_items)
  @set_list.destroy
  redirect to("/set_lists")
end
