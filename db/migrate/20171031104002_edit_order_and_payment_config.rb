class EditOrderAndPaymentConfig < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :payment_type_id, :integer
    add_column :orders, :payment_price, :integer
    add_column :orders, :income, :float
    remove_column :payment_configs, :credit
    remove_column :payment_configs, :cvs
    remove_column :payment_configs, :barcode
    remove_column :payment_configs, :barcode
  end
end
