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

ActiveRecord::Schema.define(version: 20100108151107) do

  create_table "benefits", force: true do |t|
    t.string   "patient_Name", limit: 30
    t.date     "date"
    t.decimal  "amount_Due",              precision: 10, scale: 2
    t.integer  "office_id"
    t.integer  "signoff"
    t.datetime "signoff_date"
    t.boolean  "active",                                           default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "payment_type", limit: 20
  end

  add_index "benefits", ["date"], name: "index_benefits_on_date"
  add_index "benefits", ["patient_Name"], name: "index_benefits_on_patient_Name"

  create_table "comments", force: true do |t|
    t.integer  "benefit_id", null: false
    t.integer  "user_id",    null: false
    t.text     "comment",    null: false
    t.datetime "created_at"
  end

  create_table "offices", force: true do |t|
    t.string "office", limit: 10
  end

  create_table "users", force: true do |t|
    t.string   "login",                           null: false
    t.string   "name",                            null: false
    t.string   "crypted_password",                null: false
    t.string   "password_salt",                   null: false
    t.string   "persistence_token",               null: false
    t.string   "single_access_token",             null: false
    t.string   "perishable_token",                null: false
    t.integer  "login_count",         default: 0, null: false
    t.integer  "failed_login_count",  default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
