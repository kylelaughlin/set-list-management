require_relative "../test_helper.rb"

class SetItemTest < Minitest::Test

  def test_create_set_item_under_normal_circumstances
    si = SetItem.new(order: 5, set: 1)
    refute_nil(si, "Should be an object at initialization")
  end

end
