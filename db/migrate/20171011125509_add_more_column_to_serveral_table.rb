class AddMoreColumnToServeralTable < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :department, :string
    add_column :users, :virtual_account, :string
    add_column :users, :point, :integer
    add_column :orders, :message, :string
  end
end
