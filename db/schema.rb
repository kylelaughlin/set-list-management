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

ActiveRecord::Schema.define(version: 11) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "band_members", force: :cascade do |t|
    t.string "name"
    t.string "instrument"
  end

  create_table "band_members_songs", id: false, force: :cascade do |t|
    t.integer "band_member_id", null: false
    t.integer "song_id",        null: false
  end

  create_table "set_items", force: :cascade do |t|
    t.integer "order"
    t.integer "set"
    t.integer "song_id"
    t.integer "set_list_id"
  end

  create_table "set_lists", force: :cascade do |t|
    t.string  "name"
    t.text    "notes"
    t.date    "performance_date"
    t.integer "venue_id"
    t.integer "number_of_sets"
    t.string  "venue"
  end

  create_table "songs", force: :cascade do |t|
    t.string  "title"
    t.string  "artist"
    t.boolean "active", default: true
  end

end
