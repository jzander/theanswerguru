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

ActiveRecord::Schema.define(version: 20140923213028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "decision_id"
  end

  add_index "answers", ["decision_id"], name: "index_answers_on_decision_id", using: :btree

  create_table "criteria", force: true do |t|
    t.string   "text"
    t.integer  "importance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "decision_id"
  end

  add_index "criteria", ["decision_id"], name: "index_criteria_on_decision_id", using: :btree

  create_table "criteria_answers", force: true do |t|
    t.integer  "answer_id"
    t.integer  "criterion_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "decision_id"
  end

  add_index "criteria_answers", ["answer_id"], name: "index_criteria_answers_on_answer_id", using: :btree
  add_index "criteria_answers", ["criterion_id"], name: "index_criteria_answers_on_criterion_id", using: :btree

  create_table "decisions", force: true do |t|
    t.string  "text"
    t.string  "decision"
    t.integer "user_id"
  end

  add_index "decisions", ["user_id"], name: "index_decisions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
