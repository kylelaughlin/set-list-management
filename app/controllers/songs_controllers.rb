#Songs Controllers

get '/songs' do
  @songs = Song.where(active: true).order('title')
  erb :"songs/index"
end

get '/songs/new' do
  @song = Song.new
  @band_members = BandMember.all
  erb :"songs/new"
end

post '/songs' do
  @song = Song.new(title: params['title'], artist: params['artist'])
  if @song.save
    @song.add_band_members(params)
    redirect to("/songs")
  else
    erb :"songs/new"
  end
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

get '/songs/:id/deactivate' do
  @song = Song.find_by_id(params['id'])
  if @song.update_attributes(active: false)
    redirect to("/songs/#{@song.id}")
  else
    erb :"songs/edit"
  end
end

get '/songs/:id/active' do
  @song = Song.find_by_id(params['id'])
  if @song.update_attributes(active: true)
    redirect to("/songs/#{@song.id}")
  else
    erb :"songs/edit"
  end
end

delete 'songs/:id/delete' do
  @song = Song.find_by_id(params['id'])
  @song.prepare_destruction
end
