class AddUserAuthType < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sign_in_type, :integer, default: 0
  end
end
