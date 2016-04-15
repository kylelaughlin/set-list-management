get "/band_members" do
  @band_members = BandMember.all
  erb :"band_members/index"
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
