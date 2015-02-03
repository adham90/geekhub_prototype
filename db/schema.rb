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

ActiveRecord::Schema.define(version: 20150129121453) do

  create_table "companies", force: :cascade do |t|
    t.string   "name",                limit: 255,   null: false
    t.text     "description",         limit: 65535
    t.float    "latitude",            limit: 24
    t.float    "longitude",           limit: 24
    t.string   "address",             limit: 255
    t.integer  "company_account_id",  limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "companies", ["latitude"], name: "index_companies_on_latitude", using: :btree
  add_index "companies", ["longitude"], name: "index_companies_on_longitude", using: :btree

  create_table "companies_skills", force: :cascade do |t|
    t.integer "company_id", limit: 4
    t.integer "skill_id",   limit: 4
  end

  add_index "companies_skills", ["company_id"], name: "index_companies_skills_on_company_id", using: :btree
  add_index "companies_skills", ["skill_id"], name: "index_companies_skills_on_skill_id", using: :btree

  create_table "company_accounts", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "company_id",             limit: 4
  end

  add_index "company_accounts", ["company_id"], name: "index_company_accounts_on_company_id", using: :btree
  add_index "company_accounts", ["email"], name: "index_company_accounts_on_email", unique: true, using: :btree
  add_index "company_accounts", ["reset_password_token"], name: "index_company_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "identities", force: :cascade do |t|
    t.string  "uid",        limit: 255
    t.string  "provider",   limit: 255
    t.integer "profile_id", limit: 4
  end

  add_index "identities", ["profile_id"], name: "index_identities_on_profile_id", using: :btree

  create_table "profile_jobs", force: :cascade do |t|
    t.integer "company_id",   limit: 4
    t.string  "title",        limit: 255
    t.text    "description",  limit: 65535
    t.boolean "currently_in", limit: 1,     default: false
    t.date    "enroll_date"
    t.date    "quit_date"
    t.integer "profile_id",   limit: 4
  end

  create_table "profile_skills", id: false, force: :cascade do |t|
    t.integer "profile_id",  limit: 4
    t.integer "skill_id",    limit: 4
    t.integer "rank",        limit: 4
    t.boolean "primary",     limit: 1
    t.date    "started_at"
    t.string  "description", limit: 255
  end

  add_index "profile_skills", ["profile_id", "skill_id"], name: "index_profile_skills_on_profile_id_and_skill_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "username",            limit: 255,   null: false
    t.string   "first_name",          limit: 255,   null: false
    t.string   "last_name",           limit: 255
    t.text     "bio",                 limit: 65535
    t.string   "phone",               limit: 255,   null: false
    t.integer  "rank",                limit: 4
    t.integer  "age",                 limit: 4,     null: false
    t.boolean  "gender",              limit: 1,     null: false
    t.string   "title",               limit: 255
    t.float    "latitude",            limit: 24
    t.float    "longitude",           limit: 24
    t.string   "address",             limit: 255
    t.integer  "university_id",       limit: 4
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["latitude"], name: "index_profiles_on_latitude", using: :btree
  add_index "profiles", ["longitude"], name: "index_profiles_on_longitude", using: :btree
  add_index "profiles", ["phone"], name: "index_profiles_on_phone", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree
  add_index "profiles", ["username"], name: "index_profiles_on_username", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name",                limit: 255, null: false
    t.date     "created_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "skills", ["name"], name: "index_skills_on_name", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "country",             limit: 255
    t.integer  "profile_id",          limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "profile_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profile_id"], name: "index_users_on_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
