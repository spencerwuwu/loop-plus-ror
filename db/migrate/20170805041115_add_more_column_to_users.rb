class AddMoreColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :personal_id, :string
    add_column :users, :photo, :string
    add_column :users, :birthday, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :school, :string
    add_column :users, :phone_mac, :string
    add_column :users, :enrollment, :boolean
  end
end
