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

ActiveRecord::Schema.define(version: 20141026151807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "postgis"

  create_table "organizations", force: true do |t|
    t.integer "github_id"
    t.string  "name"
    t.integer "registed_by_id"
    t.string  "avatar_url"
    t.json    "details"
  end

  create_table "organizations_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "organization_id"
  end

  add_index "organizations_users", ["user_id", "organization_id"], name: "index_organizations_users_on_user_id_and_organization_id", unique: true, using: :btree

  create_table "spatial_ref_sys", primary_key: "srid", force: true do |t|
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "agreement_accepted", default: false
    t.string   "bitcoin_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "organizations_users", "organizations", name: "organizations_users_organization_id_fk"
  add_foreign_key "organizations_users", "users", name: "organizations_users_user_id_fk"

end
