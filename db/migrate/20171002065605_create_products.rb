class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|

      t.string  :title
      t.integer :price, default: 0
      t.text    :description
      t.string  :image

      t.timestamps
    end
  end
end
