class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.string :image
      t.string :tag
      t.text :content

      t.timestamps
    end
  end
end
