#name :string representing the name of the venue
#description :text representing notes for the set list
#performance_date: date representing the date of the performance

class SetList < ActiveRecord::Base

  validates :name, presence: true
  validates :performance_date, presence: true

  has_many :set_items
  has_many :songs, through: :set_items
  belongs_to :venue

  # Creates SetItem records according to the key value pairs of the params hash
  #
  # +params: a hash representing key value pairs from the set list form
  # =>        key is structured "1,3" which represents the third song of the first set
  # =>        value is the id of the associated song records
  #
  # Returns nil - writes to the database
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
