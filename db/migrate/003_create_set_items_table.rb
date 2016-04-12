class CreateSetItemsTable < ActiveRecord::Migration
  def change
    create_table :set_items do |t|
      t.integer :order
      t.integer :set
      t.integer :song_id
      t.integer :set_list_id
    end
  end
end
