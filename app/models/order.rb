class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  resourcify

end
