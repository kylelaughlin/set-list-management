require_relative "../test_helper.rb"

class SongTest < Minitest::Test

  def test_create_song_under_normal_circumstances
    s = Song.new(title: "Shine", artist: "Collective Soul")
    refute_nil(s, "Should be a valid object at initialization")
  end

end
