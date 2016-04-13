#name :string representing the name of the venue
#description :text representing notes for the set list
#performance_date: date representing the date of the performance

class SetList < ActiveRecord::Base

  validates :name, presence: true
  validates :performance_date, presence: true

  has_many :set_items
  has_many :songs, through: :set_items
  belongs_to :venue

  def create_set_item(params, set_list_id)
    binding.pry
    (1..4).each do |set|
      (1..10).each do |song|
        key_match = "#{set},#{song}"
        params.each do |k,v|
          if k == key_match
            SetItem.create(order: song, set: set, song_id: params[key_match], set_list_id: set_list_id)
          end
        end
      end
    end
  end


end
