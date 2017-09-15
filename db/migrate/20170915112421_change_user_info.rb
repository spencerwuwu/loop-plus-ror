class ChangeUserInfo < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :username, :string
    change_column :users, :personal_id, :string, unique: true
    add_column :users, :common_email, :string
    add_column :users, :gender, :string
    add_column :users, :type, :string
  end
end
