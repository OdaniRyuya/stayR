class RemoveCommnetFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :Comment, :string
  end
end
