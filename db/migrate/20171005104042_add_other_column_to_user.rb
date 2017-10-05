class AddOtherColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :e_paper, :boolean
  end
end
