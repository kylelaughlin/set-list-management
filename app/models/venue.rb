#name :string representing the name of the venue
#address :string representing the address of the venue
class Venue < ActiveRecord::Base

  validates :name, presence: true

  has_many :set_lists
  
end
