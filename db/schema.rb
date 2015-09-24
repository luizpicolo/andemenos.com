# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150921053649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analytics", force: :cascade do |t|
    t.string   "ip"
    t.integer  "product_id"
    t.integer  "product_category_id"
    t.integer  "product_subcategory_id"
    t.integer  "offer_id"
    t.integer  "city_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "local"
    t.integer  "company_id"
  end

  add_index "analytics", ["city_id"], name: "index_analytics_on_city_id", using: :btree
  add_index "analytics", ["offer_id"], name: "index_analytics_on_offer_id", using: :btree
  add_index "analytics", ["product_category_id"], name: "index_analytics_on_product_category_id", using: :btree
  add_index "analytics", ["product_id"], name: "index_analytics_on_product_id", using: :btree
  add_index "analytics", ["product_subcategory_id"], name: "index_analytics_on_product_subcategory_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "city_id"
    t.integer  "line_of_business_id"
    t.string   "logo"
    t.text     "description"
    t.float    "lat"
    t.float    "log"
    t.string   "facebook"
    t.string   "website"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "slug"
    t.string   "phone"
    t.boolean  "status",              default: true
    t.boolean  "hightlight",          default: false
  end

  add_index "companies", ["city_id"], name: "index_companies_on_city_id", using: :btree
  add_index "companies", ["line_of_business_id"], name: "index_companies_on_line_of_business_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "iso"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "line_of_businesses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "company_id"
    t.decimal  "regular_price"
    t.decimal  "offer_price"
    t.date     "start_date_offer"
    t.date     "end_date_offer"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "offers", ["company_id"], name: "index_offers_on_company_id", using: :btree
  add_index "offers", ["product_id"], name: "index_offers_on_product_id", using: :btree

  create_table "product_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "order_of_importance", default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "slug"
  end

  create_table "product_subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "slug"
  end

  add_index "product_subcategories", ["product_category_id"], name: "index_product_subcategories_on_product_category_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_subcategory_id"
    t.string   "image"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "slug"
    t.integer  "order_of_importance",    default: 0
  end

  add_index "products", ["product_subcategory_id"], name: "index_products_on_product_subcategory_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "iso"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  add_foreign_key "analytics", "cities"
  add_foreign_key "analytics", "offers"
  add_foreign_key "analytics", "product_categories"
  add_foreign_key "analytics", "product_subcategories"
  add_foreign_key "analytics", "products"
  add_foreign_key "cities", "states"
  add_foreign_key "companies", "cities"
  add_foreign_key "companies", "line_of_businesses"
  add_foreign_key "offers", "companies"
  add_foreign_key "offers", "products"
  add_foreign_key "product_subcategories", "product_categories"
  add_foreign_key "products", "product_subcategories"
  add_foreign_key "states", "countries"
end
