class CreateBandMembersTable < ActiveRecord::Migration
  def change
    create_table :band_members do |t|
      t.string :name
      t.string :instrument
    end
  end
end
