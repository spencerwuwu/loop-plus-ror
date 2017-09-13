class ChangeUserLogin < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    change_column :users, :phone, :string, unique: true
    add_column :users, :auth_email, :string
  end
end
