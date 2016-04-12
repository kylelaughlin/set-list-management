#name :string

class BandMember < ActiveRecord::Base

  validates :name, presence: true
  validates :instrument, presence: true

  has_and_belongs_to_many :songs
end
