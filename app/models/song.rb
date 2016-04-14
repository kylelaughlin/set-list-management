#title :string
#artist :string

class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist, presence: true

  has_and_belongs_to_many :band_members
  has_many :set_items
  has_many :set_lists, through: :set_items

  def update_band_members(params)
    destroy_band_members(params)
    add_band_members(params)
  end

  def destroy_band_members(params)
    self.band_members.each do |member|
      if !params['band_members'].include?(member)
        self.band_members.destroy(member)
      end
    end
  end


  def add_band_members(params)
    if !params['band_members'].nil?
      params['band_members'].each do |id|
        member = BandMember.find_by_id(id.to_i)
        if !self.band_members.include?(member)
          self.band_members << member
        end
      end
    end
  end

end
