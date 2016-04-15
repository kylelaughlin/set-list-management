get "/band_members" do
  @band_members = BandMember.all
  erb :"band_members/index"
end

get "/band_members/new" do
  @band_member = BandMember.new
  erb :"band_members/new"
end

post "/band_members" do
  @band_member = BandMember.new(name: params['name'], instrument: params['instrument'])
  if @band_member.save
    redirect to("/band_members")
  else
    erb :"band_members/new"
  end
end

delete "/band_members/:id" do
  @band_member = BandMember.find_by_id(params['id'])
  @band_member.destroy
  redirect to("/band_members")
end

get "/band_members/:id" do
  @band_member = BandMember.find_by_id(params['id'])
  erb :"band_members/show"
end

get "/band_members/:id/edit" do
  @band_member = BandMember.find_by_id(params['id'])
  erb :"band_members/edit"
end

patch "/band_members/:id" do
  @band_member = BandMember.find_by_id(params['id'])
  if @band_member.update_attributes(name: params['name'], instrument: params['instrument'])
    redirect to("/band_members/#{@band_member.id}")
  else
    erb :"band_members/edit"
  end
end
