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

ActiveRecord::Schema.define(version: 2019_07_19_014718) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "animal"
    t.string "cut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "food_amount"
    t.string "food_unit"
    t.integer "temp"
    t.string "wood"
    t.integer "time"
    t.text "result"
    t.string "rub"
    t.string "wrap"
    t.integer "user_id"
    t.integer "food_id"
    t.integer "smoker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "results_image_file_name"
    t.string "results_image_content_type"
    t.integer "results_image_file_size"
    t.datetime "results_image_updated_at"
  end

  create_table "smokers", force: :cascade do |t|
    t.string "name"
    t.string "smoker_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "google_token"
    t.string "google_refresh_token"
  end

end
