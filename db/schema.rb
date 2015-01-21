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

ActiveRecord::Schema.define(version: 20150121113002) do

  create_table "profiles", force: :cascade do |t|
    t.string   "username",            limit: 255,   null: false
    t.string   "name",                limit: 255,   null: false
    t.text     "bio",                 limit: 65535
    t.string   "phone",               limit: 255,   null: false
    t.integer  "rank",                limit: 4
    t.integer  "age",                 limit: 4,     null: false
    t.boolean  "gender",              limit: 1,     null: false
    t.float    "latitude",            limit: 24
    t.float    "longitude",           limit: 24
    t.string   "address",             limit: 255
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

  create_table "profiles_skills", id: false, force: :cascade do |t|
    t.integer "profile_id", limit: 4
    t.integer "skill_id",   limit: 4
  end

  add_index "profiles_skills", ["profile_id", "skill_id"], name: "index_profiles_skills_on_profile_id_and_skill_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
