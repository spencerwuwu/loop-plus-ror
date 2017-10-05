class CreateRefunds < ActiveRecord::Migration[5.1]
  def change
    create_table :refunds do |t|

      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "issuer_id"
      t.string "aasm_state"
      t.string "account"
      t.text "reason"

      t.timestamps
    end
  end
end
