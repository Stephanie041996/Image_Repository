class AddUserIdToImgs < ActiveRecord::Migration[6.1]
  def change
    add_column :imgs, :user_id, :integer
    add_index :imgs, :user_id
  end
end
