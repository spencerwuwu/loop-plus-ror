class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.string  :title
      t.text    :description
      t.string  :image

      t.timestamps
    end

    create_table :users_gifts, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :gift, index: true
    end
  end
end
