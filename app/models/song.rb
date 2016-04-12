#title :string
#artist :string

class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist, presence: true

  has_and_belongs_to_many :band_members
  has_many :set_items
  has_many :set_lists, through: :set_items 
end
