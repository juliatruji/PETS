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

ActiveRecord::Schema.define(version: 2021_05_29_021446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "user"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "adopters", force: :cascade do |t|
    t.string "name"
    t.string "dni"
    t.string "address"
    t.string "cel"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "adoptions", force: :cascade do |t|
    t.date "date"
    t.bigint "pet_id", null: false
    t.bigint "admin_id", null: false
    t.bigint "adopter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_adoptions_on_admin_id"
    t.index ["adopter_id"], name: "index_adoptions_on_adopter_id"
    t.index ["pet_id"], name: "index_adoptions_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "race"
    t.string "gender"
    t.string "color"
    t.boolean "sterilized", default: false
    t.string "size"
    t.string "image"
    t.boolean "adoption_status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "veterinary_appointments", force: :cascade do |t|
    t.string "image"
    t.string "control_type"
    t.date "date"
    t.bigint "pet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_veterinary_appointments_on_pet_id"
  end

  add_foreign_key "adoptions", "admins"
  add_foreign_key "adoptions", "adopters"
  add_foreign_key "adoptions", "pets"
  add_foreign_key "veterinary_appointments", "pets"
end
