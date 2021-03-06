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

ActiveRecord::Schema.define(version: 2019_03_14_232901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.text "description"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_books_on_club_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "founder_id"
    t.index ["founder_id"], name: "index_clubs_on_founder_id"
  end

  create_table "clubs_members", force: :cascade do |t|
    t.bigint "club_id"
    t.bigint "member_id"
    t.index ["club_id"], name: "index_clubs_members_on_club_id"
    t.index ["member_id"], name: "index_clubs_members_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
  end

  add_foreign_key "books", "clubs"
  add_foreign_key "clubs", "members", column: "founder_id"
  add_foreign_key "clubs_members", "clubs"
  add_foreign_key "clubs_members", "members"
end
