# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_07_114003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "surname"
    t.string "forename"
    t.string "middle_name"
    t.datetime "birthday"
    t.string "street"
    t.integer "number_home"
    t.integer "number_appartment"
    t.string "phone"
    t.string "login"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "directions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.integer "amount"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_discounts_on_client_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "surname"
    t.string "forname"
    t.string "middle_name"
    t.string "category"
    t.integer "cabinet"
    t.string "phone"
    t.string "start_work_time"
    t.string "end_work_time"
    t.string "day_time"
    t.string "login"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "doctors_services", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_doctors_services_on_doctor_id"
    t.index ["service_id"], name: "index_doctors_services_on_service_id"
  end

  create_table "doctors_specializations", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "specialization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_doctors_specializations_on_doctor_id"
    t.index ["specialization_id"], name: "index_doctors_specializations_on_specialization_id"
  end

  create_table "records", force: :cascade do |t|
    t.datetime "record_datetime"
    t.decimal "total_cost"
    t.bigint "doctor_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "service_id"
    t.index ["client_id"], name: "index_records_on_client_id"
    t.index ["doctor_id"], name: "index_records_on_doctor_id"
    t.index ["service_id"], name: "index_records_on_service_id"
  end

  create_table "records_services", force: :cascade do |t|
    t.bigint "record_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_id"], name: "index_records_services_on_record_id"
    t.index ["service_id"], name: "index_records_services_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "direction_id", null: false
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "duration_in_minutes"
    t.index ["direction_id"], name: "index_services_on_direction_id"
  end

  create_table "specializations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visit_histories", force: :cascade do |t|
    t.text "recommendation"
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_id"], name: "index_visit_histories_on_record_id"
  end

  add_foreign_key "discounts", "clients"
  add_foreign_key "doctors_services", "doctors"
  add_foreign_key "doctors_services", "services"
  add_foreign_key "doctors_specializations", "doctors"
  add_foreign_key "doctors_specializations", "specializations"
  add_foreign_key "records", "clients"
  add_foreign_key "records", "doctors"
  add_foreign_key "records_services", "records"
  add_foreign_key "records_services", "services"
  add_foreign_key "services", "directions"
  add_foreign_key "visit_histories", "records"
end
