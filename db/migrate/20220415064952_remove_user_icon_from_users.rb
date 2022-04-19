class RemoveUserIconFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :user_icon, :string
  end
end
