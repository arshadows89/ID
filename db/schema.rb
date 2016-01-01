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

ActiveRecord::Schema.define(version: 20151230233529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forumpages", force: :cascade do |t|
    t.integer "forum_id"
  end

  create_table "forums", force: :cascade do |t|
    t.integer "post_id"
    t.string  "title"
    t.integer "forumtype_id"
  end

  create_table "forumtypes", force: :cascade do |t|
    t.string "title"
  end

  create_table "homepagenews", force: :cascade do |t|
    t.string   "title"
    t.text     "news"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "homepage_id"
  end

  create_table "homepages", force: :cascade do |t|
  end

  create_table "playlists", force: :cascade do |t|
    t.string "link"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "forum_id"
    t.integer  "forumpage_id"
  end

  create_table "recruitmentclasses", force: :cascade do |t|
    t.string "wowclass"
  end

  create_table "recruitments", force: :cascade do |t|
    t.string  "spec"
    t.boolean "recruiting"
    t.integer "recruitmentclass_id"
  end

  create_table "streams", force: :cascade do |t|
    t.string   "text"
    t.string   "link"
    t.string   "streamer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "password_digest"
    t.string   "encrypted_password"
  end

  create_table "videos", force: :cascade do |t|
    t.string   "text"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
