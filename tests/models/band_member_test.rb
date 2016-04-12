require_relative "../test_helper.rb"


class BandMemberTest < Minitest::Test

 def test_create_band_member_under_normal_circumstances
   b = BandMember.new(name: "Kyle", instrument: "guitar")
   refute_nil(b, "Should be a valid object upon initalization")
 end

end
