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

ActiveRecord::Schema.define(version: 20150817053012) do

# Could not dump table "candidates" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "employers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "name"
    t.string   "email_address"
    t.string   "website_url"
    t.string   "password_digest"
    t.string   "username"
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "slug"
    t.boolean  "admin",               default: false
    t.text     "headlines"
    t.text     "company_description"
    t.string   "industry"
    t.string   "company_size"
    t.string   "logo"
    t.string   "linkedin"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "phone_number"
    t.string   "skype_id"
    t.string   "location"
    t.string   "zip_code"
  end

  add_index "employers", ["slug"], name: "index_employers_on_slug", unique: true

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "skills"
    t.text     "description"
    t.string   "email"
    t.string   "url"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.string   "position_type"
    t.string   "pay_rate"
    t.string   "job_length"
    t.string   "travel_required"
    t.string   "employer_id"
    t.string   "candidate_id"
    t.string   "slug"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "jobs", ["slug"], name: "index_jobs_on_slug", unique: true

end
