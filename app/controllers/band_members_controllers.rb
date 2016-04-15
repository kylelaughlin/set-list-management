get "/band_members" do
  @band_members = BandMembers.all
  erb :"band_members/index"
end
