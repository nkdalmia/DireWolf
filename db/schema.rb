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

ActiveRecord::Schema.define(version: 20140924052815) do

  create_table "admins", force: true do |t|
    t.string   "name",               limit: 100,              null: false
    t.string   "username",           limit: 50,               null: false
    t.string   "email",              limit: 50
    t.string   "encrypted_password",             default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["username"], name: "index_admins_on_username", unique: true

  create_table "categories", force: true do |t|
    t.string "name",        limit: 200, default: "", null: false
    t.string "description"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true

  create_table "employers", force: true do |t|
    t.string   "company_name",                                null: false
    t.string   "contact_name",       limit: 100,              null: false
    t.string   "email",              limit: 50,               null: false
    t.string   "encrypted_password",             default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employers", ["email"], name: "index_employers_on_email", unique: true

  create_table "jobs", force: true do |t|
    t.string   "title",       limit: 200, null: false
    t.string   "description"
    t.integer  "employer_id"
    t.integer  "category_id"
    t.datetime "deadline"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["category_id"], name: "index_jobs_on_category_id"
  add_index "jobs", ["employer_id"], name: "index_jobs_on_employer_id"

  create_table "users", force: true do |t|
    t.string   "name",                   limit: 50
    t.string   "phone",                  limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
