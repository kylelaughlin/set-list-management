#name :string

class BandMember < ActiveRecord::Base

  validates :name, presence: true
  
end
