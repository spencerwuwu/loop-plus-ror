class ApplyUseruseBelongsto < ActiveRecord::Migration[5.1]
  def change
    add_index :user_uses, :user_id
    add_column :user_uses, :vehicle_id, :integer
    add_index :user_uses, :vehicle_id
  end
end
