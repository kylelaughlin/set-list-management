
get '/set_lists/new' do
  @SetList = SetList.new
  erb :"set_lists/new"
end
