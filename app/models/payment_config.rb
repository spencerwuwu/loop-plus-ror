class PaymentConfig < ApplicationRecord
  def api
    if Rails.env.production? 
      production_api
    else
      staging_api
    end
  end

  def notify_url
    if Rails.env.production? 
      production_notify_url
    else
      staging_notify_url
    end
  end

  def return_url
    if Rails.env.production? 
      production_return_url
    else
      staging_return_url
    end
  end

end
