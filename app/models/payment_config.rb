class PaymentConfig < ApplicationRecord
  def api
    if Rails.env.production? 
      production_api
    else
      staging_api
    end
  end
end
