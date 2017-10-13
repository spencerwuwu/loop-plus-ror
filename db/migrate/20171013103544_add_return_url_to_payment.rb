class AddReturnUrlToPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :payment_configs, :production_return_url, :string, default: "https://www.looplus.com.tw/user/show"
    add_column :payment_configs, :staging_return_url, :string, default: "http://dev.looplus.com.tw:7122/user/show"
    add_column :payment_configs, :production_notify_url, :string, default: "https://www.looplus.com.tw/orders/notify"
    add_column :payment_configs, :staging_notify_url, :string, default: "http://dev.looplus.com.tw:7122/orders/notify"
  end
end
