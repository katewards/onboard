class AddUserIdToRooms < ActiveRecord::Migration
  def change
  	# add column to table, what it is, what type
  	add_column :rooms, :user_id, :integer
  end
end
 