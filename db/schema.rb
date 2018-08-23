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

ActiveRecord::Schema.define(version: 2018_08_23_123832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.date "date"
    t.text "content"
    t.bigint "renting_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["renting_id"], name: "index_messages_on_renting_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "rentings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "suit_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suit_id"], name: "index_rentings_on_suit_id"
    t.index ["user_id"], name: "index_rentings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rate"
    t.date "date"
    t.bigint "renting_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["renting_id"], name: "index_reviews_on_renting_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "suits", force: :cascade do |t|
    t.bigint "user_id"
    t.string "color"
    t.text "description"
    t.string "style"
    t.string "size"
    t.integer "price_per_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.index ["user_id"], name: "index_suits_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "rentings"
  add_foreign_key "messages", "users"
  add_foreign_key "rentings", "suits"
  add_foreign_key "rentings", "users"
  add_foreign_key "reviews", "rentings"
  add_foreign_key "reviews", "users"
  add_foreign_key "suits", "users"
end
