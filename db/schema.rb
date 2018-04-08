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

ActiveRecord::Schema.define(version: 20180408043233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "school_id"
    t.string "first_name"
    t.string "last_name"
    t.bigint "division_id"
    t.bigint "grade_id"
    t.bigint "room_id"
    t.text "allergies"
    t.text "dietry_requirements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["division_id"], name: "index_children_on_division_id"
    t.index ["grade_id"], name: "index_children_on_grade_id"
    t.index ["room_id"], name: "index_children_on_room_id"
    t.index ["school_id"], name: "index_children_on_school_id"
    t.index ["user_id"], name: "index_children_on_user_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.bigint "school_id"
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_divisions_on_school_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "program_id"
    t.string "name"
    t.text "description"
    t.datetime "start_at"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_events_on_program_id"
  end

  create_table "grades", force: :cascade do |t|
    t.bigint "school_id"
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_grades_on_school_id"
  end

  create_table "programs", force: :cascade do |t|
    t.bigint "school_id"
    t.string "name"
    t.text "description"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_programs_on_school_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "school_id"
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_rooms_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "contact_name"
    t.string "contact_phone"
    t.string "contact_email"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_schools_on_slug", unique: true
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "parent"
    t.bigint "school_id"
    t.index ["email", "school_id"], name: "index_users_on_email_and_school_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  add_foreign_key "children", "divisions"
  add_foreign_key "children", "grades"
  add_foreign_key "children", "rooms"
  add_foreign_key "children", "schools"
  add_foreign_key "children", "users"
  add_foreign_key "divisions", "schools"
  add_foreign_key "events", "programs"
  add_foreign_key "grades", "schools"
  add_foreign_key "programs", "schools"
  add_foreign_key "rooms", "schools"
  add_foreign_key "users", "schools"
end
