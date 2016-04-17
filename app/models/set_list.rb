#name :string representing the name of the venue
#description :text representing notes for the set list
#performance_date: date representing the date of the performance
#number_of_sets: an integer representing the number of sets in a given setlist
#songs_per_set: the number of songs in each set

class SetList < ActiveRecord::Base

  validates :name, presence: true
  validates :performance_date, presence: true
  validates :number_of_sets, numericality: {less_than_or_equal_to: 4}
  validates :songs_per_set, numericality: {greater_than: 0}

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
    (1..number_of_sets).each do |set|
      (1..songs_per_set).each do |song|
        key_match = "#{set},#{song}"
        params.each do |k,v|
          if k == key_match
            SetItem.create(order: song, set: set, song_id: params[key_match], set_list_id: set_list_id)
          end
        end
      end
    end
  end

  def delete_set_items
    set_items = SetItem.where(set_list_id: id)
    set_items.each do |set_item|
      set_item.destroy
    end
  end

  def prepare_destruction(set_items)
    set_items.each do |set_item|
      set_item.destroy
    end
  end

  def update_sets(params)

    #set the set_id form the params hash
    if params["set_id"] == "set_1"
      set = 1
    elsif params["set_id"] == "set_2"
      set = 2
    elsif params["set_id"] == "set_3"
      set = 3
    elsif params["set_id"] == "set_4"
      set = 4
    else
      set = 1
    end


    set_items = SetItem.where(set: set, set_list_id: id)
    #if There are already set items for this set in the set list, destroy them
    if !set_items.empty?
      set_items.each do |set_item|
        set_item.destroy
      end
    end

    # if there are new songs for this set, create new set_items
    if params.key?("song_order")
      i = 1

      params[:song_order].each do |song_id|
        SetItem.create(order: i,
                       set: set,
                       song_id: song_id,
                       set_list_id: params["set_list_id"].to_i)
        i += 1
      end
    end
  end

end
