class User < ApplicationRecord
  mount_uploader :photo, LicenseUploader
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, :authentication_keys => [:login]

  # Virtual attribute for authenticating by either personal_id or email
  # This is in addition to a real persisted field like 'personal_id'
  attr_accessor :login
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:pending) if self.roles.blank?
  end


  # Only allow letter, number, underscore and punctuation.
  validates_format_of :personal_id, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

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
