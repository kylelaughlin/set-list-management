#title :string
#artist :string

class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist, presence: true

end
