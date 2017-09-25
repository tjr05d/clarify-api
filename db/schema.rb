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

ActiveRecord::Schema.define(version: 20170925135452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clarifications", force: :cascade do |t|
    t.string "url"
    t.text "selection"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.text "response_text"
    t.integer "likes"
    t.integer "dislikes"
    t.bigint "clarification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clarification_id"], name: "index_responses_on_clarification_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest", limit: 225
    t.string "access_token", limit: 225
    t.string "reset_digest", limit: 225
    t.datetime "reset_sent_at"
  end

  add_foreign_key "responses", "clarifications"
end
