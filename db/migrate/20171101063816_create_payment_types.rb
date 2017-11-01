class CreatePaymentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_types do |t|

      t.string  :name
      t.string  :argu_name
      t.float   :fee
      t.float   :addon_fee
      t.text    :description
      t.integer :barcode 
      t.integer :cvs
      t.integer :atm
      t.integer :credit

      t.timestamps
    end
  end
end
