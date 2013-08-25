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

ActiveRecord::Schema.define(version: 20130825213416) do

  create_table "accomodations", force: true do |t|
    t.datetime "departure"
    t.datetime "arrival"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.datetime "date"
    t.integer  "day_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "start_location"
    t.string   "end_location"
    t.integer  "travel_id"
    t.integer  "accomodation_id"
  end

  create_table "travels", force: true do |t|
    t.datetime "departure"
    t.datetime "arrival"
    t.string   "number"
    t.string   "mode"
    t.string   "stopover"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
