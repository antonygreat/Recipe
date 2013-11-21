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

ActiveRecord::Schema.define(version: 20131120222604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "recipeID"
    t.integer  "userID"
    t.boolean  "isBan"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "recipeID"
    t.integer  "userID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredient_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredient_sets", force: true do |t|
    t.integer  "recipeID"
    t.integer  "ingredientID"
    t.decimal  "amountNum"
    t.string   "unitOfMeasure"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.integer  "groupID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.integer  "userID"
    t.string   "title"
    t.string   "description"
    t.boolean  "isBan"
    t.integer  "imageID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_sets", force: true do |t|
    t.integer  "recipeID"
    t.integer  "typeID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.boolean  "isAdmin"
    t.boolean  "isBan"
    t.boolean  "isActivate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
