#Songs Controllers

get '/songs' do
  @songs = Song.all.order('title')
  erb :"songs/index"
end

get '/songs/:id' do
  @song = Song.find_by_id(params['id'])
  @band_members = @song.band_members
  erb :"songs/show"
end

get '/songs/:id/edit' do
  @song = Song.find_by_id(params['id'])
  erb :"songs/edit"
end
