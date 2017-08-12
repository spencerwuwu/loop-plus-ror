class User < ApplicationRecord
  mount_uploader :photo, LicenseUploader
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:pending) if self.roles.blank?
  end
end
