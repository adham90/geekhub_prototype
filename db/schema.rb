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

ActiveRecord::Schema.define(version: 20150204094307) do

  create_table "identities", force: :cascade do |t|
    t.string  "uid",        limit: 255
    t.string  "provider",   limit: 255
    t.integer "profile_id", limit: 4
  end

  add_index "identities", ["profile_id"], name: "index_identities_on_profile_id", using: :btree

  create_table "pairs", force: :cascade do |t|
    t.integer  "driver_id",                limit: 4,                     null: false
    t.integer  "navigator_id",             limit: 4,                     null: false
    t.datetime "pair_date",                                              null: false
    t.time     "pair_time",                                              null: false
    t.datetime "confirmed_at"
    t.boolean  "confirmation_status",      limit: 1
    t.float    "latitude",                 limit: 24
    t.float    "longitude",                limit: 24
    t.string   "address",                  limit: 255
    t.string   "address_details",          limit: 255
    t.text     "details",                  limit: 65535
    t.boolean  "type",                     limit: 1,     default: false
    t.string   "hangout_url",              limit: 255
    t.integer  "last_updated_by",          limit: 4
    t.boolean  "last_update_confirmation", limit: 1
    t.integer  "cancelled",                limit: 4,     default: 0
    t.datetime "cancelled_at"
    t.boolean  "done",                     limit: 1,     default: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "pairs", ["driver_id"], name: "index_pairs_on_driver_id", using: :btree
  add_index "pairs", ["latitude"], name: "index_pairs_on_latitude", using: :btree
  add_index "pairs", ["longitude"], name: "index_pairs_on_longitude", using: :btree
  add_index "pairs", ["navigator_id"], name: "index_pairs_on_navigator_id", using: :btree

  create_table "profile_jobs", force: :cascade do |t|
    t.string  "company",      limit: 255
    t.string  "title",        limit: 255
    t.text    "description",  limit: 65535
    t.boolean "currently_in", limit: 1,     default: false
    t.date    "enroll_date"
    t.date    "quit_date"
    t.integer "profile_id",   limit: 4
  end

  add_index "profile_jobs", ["profile_id"], name: "index_profile_jobs_on_profile_id", using: :btree

  create_table "profile_skills", id: false, force: :cascade do |t|
    t.integer "profile_id",  limit: 4
    t.integer "skill_id",    limit: 4
    t.integer "rank",        limit: 4
    t.boolean "primary",     limit: 1
    t.date    "started_at"
    t.string  "description", limit: 255
  end

  add_index "profile_skills", ["profile_id", "skill_id"], name: "index_profile_skills_on_profile_id_and_skill_id", using: :btree
  add_index "profile_skills", ["skill_id"], name: "fk_rails_be8d7a4399", using: :btree

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
    t.string   "university",          limit: 255
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

  add_foreign_key "profile_skills", "profiles"
  add_foreign_key "profile_skills", "profiles"
  add_foreign_key "profile_skills", "skills"
  add_foreign_key "profile_skills", "skills"
end
