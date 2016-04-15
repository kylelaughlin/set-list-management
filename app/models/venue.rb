#name :string representing the name of the venue
#address :string representing the address of the venue
class Venue < ActiveRecord::Base

  validates :name, presence: true

  has_many :set_lists

  def prepare_destruction
    set_lists = SetList.where(venue_id: id)
    new_venue = Venue.find_by_id(1)
    set_lists.each do |set_list|
      set_list.update_attributes(venue: new_venue)
    end
  end

end
