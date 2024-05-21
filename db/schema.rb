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

ActiveRecord::Schema[7.0].define(version: 2024_05_21_002348) do
  create_table "disciplines", force: :cascade do |t|
    t.integer "emp_id"
    t.integer "sup_id"
    t.string "level"
    t.date "effective"
    t.date "expires"
    t.string "reason"
    t.string "expectations"
    t.string "notes"
    t.string "title_for"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ffm_id"
    t.string "fasign"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "base"
    t.string "position"
    t.integer "emp_id"
    t.string "doh"
    t.string "access"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "fact_findings", force: :cascade do |t|
    t.integer "emp_id"
    t.date "date"
    t.time "time"
    t.integer "sup_id"
    t.string "notes"
    t.string "to_discuss"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "conclusion"
    t.string "response"
    t.date "date2"
    t.time "time2"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "emp_id"
    t.integer "sup_id"
    t.string "subject"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read"
    t.integer "disc_id"
    t.integer "ffm_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "emp_id"
    t.integer "sup_id"
    t.date "date"
    t.string "title"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "disc_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "emp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
