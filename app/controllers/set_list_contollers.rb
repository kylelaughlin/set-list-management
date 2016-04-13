
get '/set_lists/new' do
  @SetList = SetList.new
  erb :"set_lists/new"
end

get '/set_lists/new/songs' do
  @sets = params['sets']
  @num_of_songs = params['songs']
  binding.pry
end
