class Order < ApplicationRecord
  belongs_to :product
  belongs_to :payment_type
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

  def self.find_by_merchant_order_no(merchant_order_no)
    return Order.find_by_id(merchant_order_no.last(5).to_i)
  end

  def merchant_order_no
    "#{created_at.strftime('%Y%m%d%H%M%S')}#{"%05d" % id}"
  end

  def timestamp
    created_at.to_i
  end


  def get_raw(order, config, email)
    str = "MerchantID=#{config.merchant_id}&Version=#{config.version}&RespondType=#{config.respond_type}&TimeStamp=#{timestamp}&LangType=#{config.lang_type}&MerchantOrderNo=#{merchant_order_no}&Amt=#{order.payment_price}&ItemDesc=#{order.product.title}&Email=#{email}&LoginType=#{config.login_type}&ReturnURL=#{config.return_url}"

    type = "&CREDIT=#{order.payment_type.credit}&CVS=#{order.payment_type.cvs}&BARCODE=#{order.payment_type.barcode}&UNIONPAY=#{order.payment_type.credit}&WEBATM=#{order.payment_type.atm}&VACC=#{order.payment_type.atm}"

    return str + type
  end

  def trade_info(raw, config)

    Rails.logger.info "raw => #{raw}"

    cipher = OpenSSL::Cipher::AES256.new(:CBC)
    cipher.encrypt
    cipher.key = config.hash_key
    cipher.iv = config.hash_iv
    Rails.logger.info "key => #{config.hash_key}"
    Rails.logger.info "iv => #{config.hash_iv}"
    encrypted = cipher.update(raw) + cipher.final
    encrypted_tohex = encrypted.unpack('H*')
    Rails.logger.info "enc => #{encrypted_tohex[0]}"
    return encrypted_tohex[0]

  end

  def trade_sha(enc, config)
    raw = "HashKey=#{config.hash_key}&#{enc}&HashIV=#{config.hash_iv}"
    Rails.logger.info "raw2 => #{raw}"
    Rails.logger.info "Digist: #{Digest::SHA256.hexdigest(raw).upcase}"
    return Digest::SHA256.hexdigest(raw).upcase
  end

  def update_payment_result(result)
    self.status = result['Status']
    self.result = result
    self.message = result['Message']
  end
end
