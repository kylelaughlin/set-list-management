class CreateSetListsTable < ActiveRecord::Migration
  def change
    create_table :set_lists do |t|
      t.string :name
      t.text :notes
      t.date :performance_date
      t.integer :venue_id
    end
  end
end
