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

ActiveRecord::Schema.define(version: 20150106162533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "visit_id"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "appointments", ["amount"], name: "index_appointments_on_amount", using: :btree
  add_index "appointments", ["service_id"], name: "index_appointments_on_service_id", using: :btree
  add_index "appointments", ["visit_id"], name: "index_appointments_on_visit_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.boolean  "selected",                default: false
  end

  add_index "businesses", ["deleted_at"], name: "index_businesses_on_deleted_at", using: :btree
  add_index "businesses", ["name"], name: "index_businesses_on_name", using: :btree
  add_index "businesses", ["owner_id"], name: "index_businesses_on_owner_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "business_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["business_id", "service_id"], name: "index_categories_on_business_id_and_service_id", unique: true, using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",  limit: 255
    t.string   "middle_name", limit: 255
    t.string   "last_name",   limit: 255
    t.string   "referred_by", limit: 255
    t.integer  "business_id"
    t.string   "email",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "customers", ["business_id"], name: "index_customers_on_business_id", using: :btree
  add_index "customers", ["deleted_at"], name: "index_customers_on_deleted_at", using: :btree

  create_table "deals", force: :cascade do |t|
    t.integer  "customer_id"
    t.date     "date_purchased"
    t.date     "date_completed"
    t.integer  "used_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "package_id"
    t.integer  "business_id"
    t.boolean  "active",         default: false
  end

  add_index "deals", ["customer_id"], name: "index_deals_on_customer_id", using: :btree

  create_table "owners", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "middle_name",            limit: 255
    t.boolean  "admin",                              default: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",                    default: 0,     null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "owners", ["confirmation_token"], name: "index_owners_on_confirmation_token", unique: true, using: :btree
  add_index "owners", ["deleted_at"], name: "index_owners_on_deleted_at", using: :btree
  add_index "owners", ["email"], name: "index_owners_on_email", unique: true, using: :btree
  add_index "owners", ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true, using: :btree
  add_index "owners", ["unlock_token"], name: "index_owners_on_unlock_token", unique: true, using: :btree

  create_table "packages", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.integer  "count"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
  end

  add_index "packages", ["business_id"], name: "index_packages_on_business_id", using: :btree

  create_table "phones", force: :cascade do |t|
    t.string   "number",         limit: 10
    t.integer  "phoneable_id"
    t.string   "phoneable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phones", ["phoneable_type", "phoneable_id"], name: "index_phones_on_phoneable_type_and_phoneable_id", using: :btree

  create_table "prices", force: :cascade do |t|
    t.decimal  "amount",                 precision: 8, scale: 2
    t.integer  "cost_id"
    t.string   "cost_type",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prices", ["cost_type", "cost_id"], name: "index_prices_on_cost_type_and_cost_id", unique: true, using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["business_id"], name: "index_services_on_business_id", using: :btree

  create_table "services_visits", force: :cascade do |t|
    t.integer "service_id"
    t.integer "visit_id"
  end

  create_table "visits", force: :cascade do |t|
    t.text     "visit_notes"
    t.date     "date_of_visit"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "business_id"
    t.integer  "deal_id"
    t.boolean  "deal_visit",    default: false
  end

  add_index "visits", ["business_id"], name: "index_visits_on_business_id", using: :btree
  add_index "visits", ["customer_id"], name: "index_visits_on_customer_id", using: :btree

  add_foreign_key "appointments", "services"
  add_foreign_key "appointments", "visits"
end
