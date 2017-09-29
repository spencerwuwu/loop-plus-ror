require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    roles: Field::HasMany,
    user_uses: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    id_pic_front: LicenseField,
    id_pic_rear: LicenseField,
    license_pic_rear: LicenseField,
    license_pic_front: LicenseField,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String,
    last_sign_in_ip: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    name: Field::String,
    personal_id: Field::String,
    birthday: Field::String,
    phone: Field::String,
    address: Field::String,
    school: Field::String,
    enrollment: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :email,
    :school,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :user_uses,
    :email,
    :personal_id,
    :birthday,
    :phone,
    :address,
    :school,
    :enrollment,
    :id_pic_front,
    :id_pic_rear,
    :license_pic_rear,
    :license_pic_front,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :created_at,
    :updated_at,
    :roles,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :email,
    :personal_id,
    :birthday,
    :phone,
    :address,
    :school,
    :enrollment,
    :id_pic_front,
    :id_pic_rear,
    :license_pic_rear,
    :license_pic_front,
    :roles,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
