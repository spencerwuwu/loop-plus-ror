# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171101063816) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "image"
    t.string "tag"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banners", force: :cascade do |t|
    t.string "url"
    t.string "image"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.integer "product_id"
    t.integer "user_id"
    t.string "type"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state", default: "created"
    t.string "status"
    t.string "message"
    t.integer "payment_type_id"
    t.integer "payment_price"
    t.float "income"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_configs", force: :cascade do |t|
    t.string "description"
    t.string "string", default: "https://ccore.spgateway.com/MPG/mpg_gateway"
    t.string "hash_key"
    t.string "hash_iv"
    t.string "merchant_id"
    t.string "respond_type", default: "JSON"
    t.string "lang_type", default: "zh-tw"
    t.string "login_type", default: "0"
    t.string "version", default: "1.4"
    t.string "production_api", default: "https://core.spgateway.com/MPG/mpg_gateway"
    t.string "staging_api", default: "https://ccore.spgateway.com/MPG/mpg_gateway"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "production_return_url", default: "https://www.looplus.com.tw/user/show"
    t.string "staging_return_url", default: "http://dev.looplus.com.tw:7122/user/show"
    t.string "production_notify_url", default: "https://www.looplus.com.tw/orders/notify"
    t.string "staging_notify_url", default: "http://dev.looplus.com.tw:7122/orders/notify"
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "name"
    t.string "argu_name"
    t.float "fee"
    t.float "addon_fee"
    t.text "description"
    t.integer "barcode"
    t.integer "cvs"
    t.integer "atm"
    t.integer "credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.integer "price", default: 0
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refunds", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "issuer_id"
    t.string "aasm_state"
    t.string "account"
    t.text "reason"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "spotlights", force: :cascade do |t|
    t.string "title"
    t.string "sub_title"
    t.string "url"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rank"
  end

  create_table "stations", force: :cascade do |t|
    t.float "positionX"
    t.float "positionY"
    t.text "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_uses", force: :cascade do |t|
    t.integer "user_id"
    t.float "amount"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vehicle_id"
    t.index ["user_id"], name: "index_user_uses_on_user_id"
    t.index ["vehicle_id"], name: "index_user_uses_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "personal_id"
    t.string "photo"
    t.string "birthday"
    t.string "phone"
    t.string "address"
    t.string "school"
    t.string "phone_mac"
    t.boolean "enrollment"
    t.integer "sign_in_type", default: 0
    t.string "provider"
    t.string "uid"
    t.string "auth_email"
    t.string "common_email"
    t.string "gender"
    t.string "type"
    t.string "id_pic_front"
    t.string "id_pic_rear"
    t.string "license_pic_rear"
    t.string "license_pic_front"
    t.string "e_contact_name"
    t.string "e_contact_relat"
    t.string "e_contact_phone"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "e_paper"
    t.string "department"
    t.string "virtual_account"
    t.integer "point"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_gifts", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "gift_id"
    t.index ["gift_id"], name: "index_users_gifts_on_gift_id"
    t.index ["user_id"], name: "index_users_gifts_on_user_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.float "postitionX"
    t.float "positionY"
    t.text "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
