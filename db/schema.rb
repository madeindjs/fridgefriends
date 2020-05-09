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

ActiveRecord::Schema.define(version: 2020_05_09_150554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "donations", force: :cascade do |t|
    t.bigint "giver_id"
    t.bigint "receiver_id"
    t.string "photo"
    t.date "deadline"
    t.string "status", default: "pending"
    t.boolean "pick_up", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description", default: "Je donne tout !"
    t.string "categories", default: [], array: true
    t.index ["giver_id"], name: "index_donations_on_giver_id"
    t.index ["receiver_id"], name: "index_donations_on_receiver_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "friend_id"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_relationships_on_friend_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
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
    t.string "phone_number"
    t.string "avatar"
    t.string "address"
    t.datetime "deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "donations", "users", column: "giver_id"
  add_foreign_key "donations", "users", column: "receiver_id"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "friend_id"
end
