
get '/set_lists/new' do
  @set_list = SetList.new
  erb :"set_lists/new"
end

post '/set_lists/new/list' do
  binding.pry
  @name = params['name']
  #break this into a helper class?
  date_parts = params['date'].split("-")
  @date = Date.new(date_parts[0].to_i,date_parts[1].to_i,date_parts[2].to_i)
  @set_list = SetList.new(name: @name, performance_date: @date)
  if @set_list.save
    redirect to("/set_lists/new/#{@set_list.id}")
  else
    erb :"set_lists/new"
  end
end

get '/set_lists/new/:id' do
  @sets = params['sets']
  @num_of_songs = params['songs']
  erb :"set_lists/new_list"
end
