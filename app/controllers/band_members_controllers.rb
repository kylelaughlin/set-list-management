get "/band_members" do
  @band_members = BandMember.all
  erb :"band_members/index"
end
