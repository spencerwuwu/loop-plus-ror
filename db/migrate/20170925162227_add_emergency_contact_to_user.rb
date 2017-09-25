class AddEmergencyContactToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :e_contact_name, :string
    add_column :users, :e_contact_relat, :string
    add_column :users, :e_contact_phone, :string
  end
end
