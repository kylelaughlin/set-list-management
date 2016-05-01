#name :string representing the name of the venue
#description :text representing notes for the set list
#performance_date: date representing the date of the performance
#number_of_sets: an integer representing the number of sets in a given setlist
#songs_per_set: the number of songs in each set

class SetList < ActiveRecord::Base

  has_many :set_items
  has_many :songs, through: :set_items
  belongs_to :venue

  # Destroys SetItem records that are associated with a set list
  #
  # +set_items: an array of set_items assocated with a set list-style-type
  #
  # Returns the array of set_items that were deleted
  def prepare_destruction(set_items)
    set_items.each do |set_item|
      set_item.destroy
    end
  end

  # Updates a set's SetItem records by deleting any and re-building
  #
  # +params: a hash representing the data supplied from the web request
  #
  # Returns nil
  def update_sets(params)
    #set the set_id form the params hash
    set = determine_set_id(params["set_id"])
    set_items = SetItem.where(set: set, set_list_id: id)
    #if There are already set items for this set in the set list, destroy them
    if !set_items.empty?
      prepare_destruction(set_items)
    end
    # if the set list is not empty, create new set items for the set
    if params.key?("song_order")
      create_set_items(params, set)
    end
  end

  # Assigns an integer set id from the string set_id from the params hash
  #
  # +set_id: the string representation of the set id from the params hash
  #
  # Returns an integer represetning the set being updated
  def determine_set_id(set_id)
    if set_id == "set_1"
      set = 1
    elsif set_id == "set_2"
      set = 2
    elsif set_id == "set_3"
      set = 3
    elsif set_id == "set_4"
      set = 4
    else
      ""
    end
    set
  end

  # Create all SetItem records for a set
  #
  # +params: a hash representing the data supplied from the web request
  #
  # Returns the song_order array from the params hash
  def create_set_items(params, set)
    i = 1
    params[:song_order].each do |song_id|
      SetItem.create(order: i,
                     set: set,
                     song_id: song_id,
                     set_list_id: params["set_list_id"].to_i)
      i += 1
    end
  end

  # Creates an array of Song objects that have not already been used in a set list-style-type
  #
  # +set_items: SetItem objects that have already been used in a set_4
  #
  # Returns an array of Song objects that are still available to be used in a set list
  def available_songs(set_items)
    used_songs = []
    set_items.each do |set_item|
      used_songs << set_item.song_id
    end
    songs = Song.where('id NOT IN (?)',used_songs)
  end

end
