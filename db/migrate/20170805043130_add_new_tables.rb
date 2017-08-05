class AddNewTables < ActiveRecord::Migration[5.1]
  def change
    create_table :user_buys do |t|
      t.integer   :user_id
      t.float     :amount
      t.datetime  :created_date
      t.boolean   :paid

      t.timestamps
    end

    create_table :user_uses do |t|
      t.integer   :user_id
      t.float     :amount
      t.datetime  :date

      t.timestamps
    end

    create_table :vehicles do |t|
      t.float     :positionX
      t.float     :positionY
      t.text      :status

      t.timestamps
    end

    create_table :stations do |t|
      t.float     :positionX
      t.float     :positionY
      t.text      :status

      t.timestamps
    end
  end
end
