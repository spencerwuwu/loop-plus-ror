class User < ApplicationRecord
  mount_uploader :license_pic_front, LicenseUploader
  mount_uploader :license_pic_rear, LicenseUploader
  mount_uploader :id_pic_front, LicenseUploader
  mount_uploader :id_pic_rear, LicenseUploader
  has_many :user_uses
  has_many :orders
  has_many :refunds
  has_and_belongs_to_many :gifts
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :authentication_keys => [:login]

  # Virtual attribute for authenticating by either personal_id or email
  # This is in addition to a real persisted field like 'personal_id'

  # Only allow personal_id form.
  validates :personal_id,
  :presence => true, 
  :uniqueness => true,
  :format => { 
    with: /^[A-Z][0-9]*$/, 
    multiline: true,
    message: "身份證格式不符合或已註冊" 
  }

  validates :name, presence: true
  validates :gender, presence: true
  attr_accessor :login
  after_create :assign_default_role

  # Create default role
  def assign_default_role
    self.add_role(:un_finish) if self.roles.blank?
  end

  # Search mehtod for view
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("email LIKE ?", "%#{search}%")
    where("personal_id LIKE ?", "%#{search}%")
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(personal_id) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:personal_id].nil?
        where(conditions).first
      else
        where(personal_id: conditions[:personal_id]).first
      end
    end
  end

  # omniauth is currently unused
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
