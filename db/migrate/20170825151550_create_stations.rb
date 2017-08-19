class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.float :positionX
      t.float :positionY
      t.text :status

      t.timestamps
    end
  end
end
