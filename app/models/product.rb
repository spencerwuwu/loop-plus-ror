class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :orders
  resourcify

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("description LIKE ?", "%#{search}%")
  end
end
