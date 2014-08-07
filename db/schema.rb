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

ActiveRecord::Schema.define(version: 20140807185926) do

  create_table "group_memberships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "user_id"
  end

  add_index "group_memberships", ["group_id"], name: "index_group_memberships_on_group_id"
  add_index "group_memberships", ["user_id"], name: "index_group_memberships_on_user_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  add_index "groups", ["owner_id"], name: "index_groups_on_owner_id"

  create_table "targets", force: true do |t|
    t.string   "outcome1"
    t.string   "outcome2"
    t.string   "final_outcome"
    t.string   "group_prediction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "owner_id"
    t.string   "name"
    t.text     "prompt_or_cue"
    t.string   "coordinate"
  end

  add_index "targets", ["group_id"], name: "index_targets_on_group_id"
  add_index "targets", ["owner_id"], name: "index_targets_on_owner_id"

  create_table "trials", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "target_id"
    t.integer  "user_id"
    t.integer  "owner_id"
    t.text     "transcript_as_text"
  end

  add_index "trials", ["owner_id"], name: "index_trials_on_owner_id"
  add_index "trials", ["target_id"], name: "index_trials_on_target_id"
  add_index "trials", ["user_id"], name: "index_trials_on_user_id"

  create_table "users", force: true do |t|
    t.string   "crypted_password",          limit: 40
    t.string   "salt",                      limit: 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                default: "invited"
    t.datetime "key_timestamp"
    t.boolean  "projectmanager",                       default: false
  end

  add_index "users", ["state"], name: "index_users_on_state"

end
