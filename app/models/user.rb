class User < ApplicationRecord
  mount_uploader :photo, LicenseUploader
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:pending) if self.roles.blank?
  end

  def self.from_omniauth_nctu(response)
    auth = JSON.parse(response)
    where(provider: "nctu", uid: auth['username']).first_or_create do |user|
      user.email = auth['email']
      user.school = "NCTU" 
      user.password = Devise.friendly_token[0,20]
      user.sign_in_type = 1
    end

  end


end
