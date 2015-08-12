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

ActiveRecord::Schema.define(version: 20150812180938) do

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email_address"
    t.string   "password_digest"
    t.string   "phone"
    t.text     "about"
    t.string   "headline"
    t.string   "experience"
    t.string   "education"
    t.string   "desired_salary"
    t.string   "city"
    t.string   "zip_code"
    t.string   "country"
    t.string   "linkedin_url"
    t.string   "twitter_url"
    t.string   "github_url"
    t.string   "dribbble_url"
    t.string   "facebook_url"
    t.string   "provider"
    t.string   "uid"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "skype_id"
    t.string   "availability"
    t.string   "skills"
    t.string   "job_type"
    t.string   "languages"
    t.string   "how_heard"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "slug"
    t.string   "avatar"
    t.string   "resume"
    t.string   "projects_link"
    t.string   "portfolio_url"
  end

  add_index "candidates", ["slug"], name: "index_candidates_on_slug", unique: true

  create_table "employers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "name"
    t.string   "email_address"
    t.string   "website_url"
    t.string   "password_digest"
    t.string   "username"
    t.string   "avatar"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "slug"
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

end
