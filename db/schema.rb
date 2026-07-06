# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_07_06_020451) do
  create_table "customers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "birthday"
    t.datetime "created_at", null: false
    t.string "email"
    t.integer "gender"
    t.date "join_date"
    t.string "name"
    t.string "name_kana"
    t.string "phone"
    t.string "referral_source"
    t.integer "status"
    t.bigint "store_id", null: false
    t.bigint "trainer_id", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_customers_on_store_id"
    t.index ["trainer_id"], name: "index_customers_on_trainer_id"
  end

  create_table "sessions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "stores", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "area"
    t.string "code"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "manager_name"
    t.string "name"
    t.string "phone"
    t.integer "status"
    t.datetime "updated_at", null: false
  end

  create_table "trainers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.integer "employment_type"
    t.string "name"
    t.string "phone"
    t.date "registered_on"
    t.integer "role"
    t.integer "session_price"
    t.bigint "store_id", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_trainers_on_store_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "customers", "stores"
  add_foreign_key "customers", "trainers"
  add_foreign_key "sessions", "users"
  add_foreign_key "trainers", "stores"
end
