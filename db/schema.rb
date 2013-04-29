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

ActiveRecord::Schema.define(:version => 20130429211757) do

  create_table "blurbs", :force => true do |t|
    t.string "name",    :limit => 50
    t.text   "content"
    t.string "cat"
  end

  create_table "events", :force => true do |t|
    t.string   "what"
    t.datetime "when"
    t.string   "where"
    t.string   "yes"
    t.string   "no"
    t.string   "dk"
    t.string   "prob"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.string    "name",               :limit => 50
    t.string    "event",              :limit => 50
    t.string    "year",               :limit => 50
    t.text      "comment"
    t.timestamp "created_at",                       :null => false
    t.string    "photo",              :limit => 50
    t.string    "photo_uid",          :limit => 50
    t.string    "photo_file_name"
    t.string    "photo_content_type"
    t.integer   "photo_file_size"
    t.timestamp "photo_updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "fname",                  :limit => 50
    t.string   "sname",                  :limit => 50
    t.string   "email",                  :limit => 50
    t.string   "phone",                  :limit => 50
    t.string   "mobile",                 :limit => 50
    t.string   "username",               :limit => 50
    t.string   "password_bak",           :limit => 50
    t.string   "role",                   :limit => 50
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "authentication_token"
    t.datetime "password_changed_at"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["password_changed_at"], :name => "index_members_on_password_changed_at"
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string "name",        :limit => 50
    t.text   "description"
    t.string "url",         :limit => 50
  end

end
