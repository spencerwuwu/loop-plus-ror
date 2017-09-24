class ChangeServeralColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :id_pic_front, :string
    add_column :users, :id_pic_rear, :string
    add_column :users, :license_pic_rear, :string
    add_column :users, :license_pic_front, :string
    add_column :spotlights, :rank, :integer
  end
end
