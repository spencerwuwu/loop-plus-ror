class CreateSpotlights < ActiveRecord::Migration[5.1]
  def change
    create_table :spotlights do |t|
      t.string :title
      t.string :sub_title
      t.string :url
      t.string :image

      t.timestamps
    end
  end
end
