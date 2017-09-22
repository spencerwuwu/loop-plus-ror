class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.string :url
      t.string :image
      t.integer :rank

      t.timestamps
    end
  end
end
