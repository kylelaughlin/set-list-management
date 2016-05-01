class AddVenueToSetListsTable < ActiveRecord::Migration
  def change
    add_column :set_lists, :venue, :string
  end
end
