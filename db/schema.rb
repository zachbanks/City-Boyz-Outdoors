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

ActiveRecord::Schema.define(:version => 20110722214716) do

  create_table "admins", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
  end

  create_table "comments", :force => true do |t|
    t.integer  "video_id"
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_medias", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "source_url"
    t.text     "description"
    t.string   "permalink"
    t.string   "thumbnail_url"
  end

  create_table "social_messages", :force => true do |t|
    t.text     "body"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_posted"
  end

  create_table "team_members", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_url"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "permalink"
    t.string   "thumbnail_url"
  end

end
