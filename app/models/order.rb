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
  end

end
