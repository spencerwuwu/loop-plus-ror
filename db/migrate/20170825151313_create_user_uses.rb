class CreateUserUses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_uses do |t|
      t.integer :user_id
      t.float :amount
      t.datetime :date

      t.timestamps
    end
  end
end
