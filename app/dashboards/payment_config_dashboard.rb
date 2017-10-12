require "administrate/base_dashboard"

class PaymentConfigDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    description: Field::String,
    string: Field::String,
    hash_key: Field::String,
    hash_iv: Field::String,
    merchant_id: Field::String,
    respond_type: Field::String,
    lang_type: Field::String,
    login_type: Field::String,
    credit: Field::String,
    cvs: Field::String,
    barcode: Field::String,
    version: Field::String,
    production_api: Field::String,
    staging_api: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :description,
    :string,
    :hash_key,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :description,
    :string,
    :hash_key,
    :hash_iv,
    :merchant_id,
    :respond_type,
    :lang_type,
    :login_type,
    :credit,
    :cvs,
    :barcode,
    :version,
    :production_api,
    :staging_api,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :description,
    :string,
    :hash_key,
    :hash_iv,
    :merchant_id,
    :respond_type,
    :lang_type,
    :login_type,
    :credit,
    :cvs,
    :barcode,
    :version,
    :production_api,
    :staging_api,
  ].freeze

  # Overwrite this method to customize how payment configs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(payment_config)
  #   "PaymentConfig ##{payment_config.id}"
  # end
end
