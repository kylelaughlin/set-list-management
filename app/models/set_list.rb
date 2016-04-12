#name :string representing the name of the venue
#description :text representing notes for the set list
#performance_date: date representing the date of the performance

class SetList < ActiveRecord::Base

  validates :name, presence: true
  validates :performance_date, presence: true

  has_many :set_items
  has_many :songs, through: :set_items
  belongs_to :venue

end
