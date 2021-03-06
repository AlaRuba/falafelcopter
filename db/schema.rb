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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130307064900) do

  create_table "answers", :force => true do |t|
    t.integer  "question"
    t.string   "reply"
    t.integer  "resource"
    t.integer  "followup"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "hasfq"
    t.boolean  "resource_bool"
  end

  create_table "histories", :force => true do |t|
    t.string   "responses"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "date"
    t.string   "language"
  end

  create_table "patients", :force => true do |t|
    t.string   "answers"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "entry"
    t.integer  "exit"
    t.string   "language"
  end

  create_table "questions", :force => true do |t|
    t.text     "ask"
    t.integer  "follows"
    t.integer  "order"
    t.integer  "a1"
    t.integer  "a2"
    t.integer  "a3"
    t.integer  "a4"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "follow"
    t.string   "category"
    t.string   "language"
    t.integer  "a5"
    t.integer  "a6"
    t.integer  "a7"
    t.integer  "a8"
  end

  create_table "resources", :force => true do |t|
    t.text     "name"
    t.text     "address1"
    t.text     "address2"
    t.text     "city"
    t.text     "zipcode"
    t.integer  "phone1"
    t.integer  "phone2"
    t.integer  "phone3"
    t.text     "website"
    t.text     "instructions"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "answer_id"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "start"
    t.integer  "end"
    t.integer  "end_time"
    t.integer  "entry"
    t.integer  "exit"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "language"
  end

end
