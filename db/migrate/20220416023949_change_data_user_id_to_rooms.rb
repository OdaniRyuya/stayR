class ChangeDataUserIdToRooms < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :user_id, :integer
  end
end
