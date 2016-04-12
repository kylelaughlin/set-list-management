require_relative "../test_helper.rb"

class VenueTest < Minitest::Test

  def test_create_venue_object_under_normal_circumstances
    v = Venue.new(name:"Bobs", address: "123 Street")
    refute_nil(v, "Should be a valid object at initialization.")
  end

end
