class AddActiveColumnToSongsTable < ActiveRecord::Migration
  def change
    add_column :songs, :active, :boolean, :default => true
  end
end
