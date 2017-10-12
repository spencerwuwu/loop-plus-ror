class CreatePaymentConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_configs do |t|
      t.string :description, :string
      t.string :hash_key, :string
      t.string :hash_iv, :string
      t.string :merchant_id, :string
      t.string :respond_type, :string, default: "JSON"
      t.string :lang_type, :string, default: "zh-tw"
      t.string :login_type, :string, default: "0"
      t.string :credit, :string, default: "1"
      t.string :cvs, :string, default: "1"
      t.string :barcode, :string, default: "1"
      t.string :version, :string, default: "1,4"
      t.string :production_api, :string, default: "https://core.spgateway.com/MPG/mpg_gateway"
      t.string :staging_api, :string, default: "https://ccore.spgateway.com/MPG/mpg_gateway"

      t.timestamps
    end
  end
end
