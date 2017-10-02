class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string   "state"
      t.integer  "product_id"
      t.integer  "user_id"
      t.string   "type"
      t.string   "result"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string   "aasm_state", default: "created"
      t.string   "status"

      t.timestamps
    end

    add_index :orders, :user_id
    add_index :orders, :product_id
  end
end
