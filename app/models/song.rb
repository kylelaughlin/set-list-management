#title :string
#artist :string

class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist, presence: true

  has_and_belongs_to_many :band_members
  has_many :set_items
  has_many :set_lists, through: :set_items

=begin
  def update_band_members(params)
    params.each do |k,v|
      if (k =~ /band/) == 0
        band_member = BandMember.find_by_id(v)
        self.band_members << band_member
      end
    end
  end
=end

  def update_band_members(params)
    self.band_members.each do |member|
      if !params['band_members'].include?(member)
        self.band_members.destroy(member)
      end
    end
    params['band_members'].each do |id|
      member = BandMember.find_by_id(id.to_i)
      if !self.band_members.include?(member)

        self.band_members << member
      end
    end
  end

end
