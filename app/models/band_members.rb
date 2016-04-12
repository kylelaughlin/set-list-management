#name :string

class BandMember < ActiveRecord::Base

  validates :name, presence: true
  validates :instrument, presence: true
  
end
