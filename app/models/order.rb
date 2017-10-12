class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  resourcify

  include AASM

  # Search for view
  def self.search(search)
    where("user.name LIKE ?", "%#{search}%")
    where("product.title LIKE ?", "%#{search}%")
    where("aasm_state LIKE ?", "%#{search}%")
  end

  # AASM states
  aasm do
    state :created, :initial => true
    state :confirmed, :payment_received, :product_shipped, :has_error

    event :confirm do
      transitions :from => :created, :to => :confirmed
      transitions :from => :payment_received, :to => :payment_received
    end

    event :notify do
      transitions :from => :confirmed, :to => :payment_received
      transitions :from => :created, :to => :payment_received
    end

    event :ship do
      transitions :from => :payment_received, :to => :product_shipped
    end

    event :save_error do
      transitions :from => :created, :to => :has_error
      transitions :from => :confirmed, :to => :has_error
      transitions :from => :payment_received, :to => :has_error
      transitions :from => :product_shipped, :to => :has_error
      transitions :from => :has_error, :to => :has_error
    end
  end

  def checkvalue(config)
    raw = "HashKey=#{config.hash_key}&Amt=#{product.price}&MerchantID=#{config.merchant_id}&MerchantOrderNo=#{merchant_order_no}&TimeStamp=#{timestamp}&Version=#{config.version}&HashIV=#{config.hash_iv}"
    return Digest::SHA256.hexdigest(raw).upcase
  end

  def timestamp
    created_at.to_i
  end

  def update_payment_result(result)
    self.status = result['Status']
    self.result = result
    self.message = result['Message']
  end
end
