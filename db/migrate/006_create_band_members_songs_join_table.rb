class CreateBandMembersSongsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :band_members, :songs
  end
end
