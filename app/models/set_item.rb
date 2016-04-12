#order: integer representing the place in a set of a song_id
#set: integer representing the set the song is placed in

class SetItem < ActiveRecord::Base

  validates :order, presence: true
  validates :set, presence: true

end
