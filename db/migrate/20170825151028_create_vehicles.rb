class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.float :postitionX
      t.float :positionY
      t.text :status

      t.timestamps
    end
  end
end
