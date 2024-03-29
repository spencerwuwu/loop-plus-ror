require "administrate/base_dashboard"

class PaymentTypeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    orders: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    argu_name: Field::String,
    fee: Field::Number.with_options(decimals: 2),
    addon_fee: Field::Number.with_options(decimals: 2),
    description: Field::Text,
    barcode: Field::Number,
    cvs: Field::Number,
    atm: Field::Number,
    credit: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    fee: Field::Number.with_options(decimals: 2),
    addon_fee: Field::Number.with_options(decimals: 2),
    description: Field::Text,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :fee,
    :addon_fee,
    :description,
    :argu_name,
    :barcode,
    :cvs,
    :atm,
    :credit,
    :orders,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :fee,
    :addon_fee,
    :description,
  ].freeze

  # Overwrite this method to customize how payment types are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(payment_type)
  #   "PaymentType ##{payment_type.id}"
  # end
end
