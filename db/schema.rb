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

ActiveRecord::Schema.define(version: 20170712213911) do

  create_table "accounts", force: :cascade do |t|
    t.string   "account_number"
    t.integer  "user_id"
    t.integer  "card_id"
    t.integer  "credit_line"
    t.datetime "due_date"
    t.datetime "open_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "bank_partners", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_bank_partners", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "bank_partner_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "card_bank_partners", ["card_id", "bank_partner_id"], name: "by_card_bank_partner", unique: true

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.integer  "type"
    t.text     "bonus"
    t.string   "apr"
    t.integer  "anual_fee"
    t.string   "credit_needed"
    t.integer  "balance_trancfer_apr"
    t.integer  "balance_transfer_period"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
