class AddSetsAndSongsToSetListTable < ActiveRecord::Migration
  def change
    add_column :set_lists, :number_of_sets, :integer
    add_column :set_lists, :songs_per_set, :integer
  end
end
