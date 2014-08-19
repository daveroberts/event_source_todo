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

ActiveRecord::Schema.define(version: 20140818014946) do

  create_table "event_log", force: true do |t|
    t.string   "event_name"
    t.datetime "event_time"
    t.string   "event_params"
    t.integer  "event_number"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_version_number", force: true do |t|
    t.integer "version"
  end

  create_table "todos", force: true do |t|
    t.string   "guid"
    t.string   "title"
    t.string   "description"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
