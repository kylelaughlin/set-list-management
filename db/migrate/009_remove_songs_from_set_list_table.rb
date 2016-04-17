class RemoveSongsFromSetListTable < ActiveRecord::Migration
  def change
    remove_column :set_lists :songs_per_set :integer
  end
end
