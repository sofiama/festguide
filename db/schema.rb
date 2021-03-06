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

ActiveRecord::Schema.define(version: 20150309213643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string  "name"
    t.boolean "approved", default: false
  end

  create_table "instagram_accounts", force: true do |t|
    t.string   "username"
    t.integer  "userid"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instagram_posts", force: true do |t|
    t.datetime "caption_time"
    t.text     "caption_text"
    t.string   "thumbnail_url"
    t.string   "std_resolution_url"
    t.string   "source_url"
    t.integer  "likes"
    t.integer  "instagram_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_accounts", force: true do |t|
    t.string   "username"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_tweets", force: true do |t|
    t.text     "text"
    t.datetime "time"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tweet_id",           limit: 8
    t.integer  "twitter_account_id", limit: 8
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "youtube_accounts", force: true do |t|
    t.string   "username"
    t.string   "playlist_upload_id"
    t.string   "playlist_upload_url"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "youtube_videos", force: true do |t|
    t.string   "video_id"
    t.string   "thumbnail"
    t.string   "title"
    t.string   "published_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "youtube_account_id"
  end

end
