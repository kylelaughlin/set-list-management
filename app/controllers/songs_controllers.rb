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
  @band_members = BandMember.all
  @song_players = @song.band_members
  erb :"songs/edit"
end

patch '/songs/:id' do
  @song = Song.find_by_id(params['id'])
  @song.update_band_members(params)
  @band_members = BandMember.all
  @song_players = @song.band_members
  if @song.update_attributes(title: params['title'], artist: params['artist'])
    redirect to("/songs/#{@song.id}")
  else
    erb :"songs/edit"
  end
end
