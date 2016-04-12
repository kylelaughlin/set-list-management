require_relative "../test_helper.rb"

class SetListTest < Minitest::Test

  def test_create_set_list_object_under_normal_circumstances
    d = Date.new(2016,2,5)
    sl = SetList.new(name: "Bobs 5/21", notes: "Usual load in time and pay: $350", performance_date: d)
    refute_nil(sl,"Should be a valid date at initialization")
  end

end
