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

ActiveRecord::Schema.define(version: 20140903145320) do

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["name"], name: "index_members_on_name", unique: true

  create_table "members_services", force: true do |t|
    t.integer  "service_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members_services", ["member_id"], name: "index_members_services_on_member_id"
  add_index "members_services", ["service_id"], name: "index_members_services_on_service_id"

  create_table "offices", force: true do |t|
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_templates", force: true do |t|
    t.string   "name"
    t.integer  "leader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_templates", ["name"], name: "index_service_templates_on_name", unique: true

  create_table "services", force: true do |t|
    t.string   "name"
    t.integer  "task_left"
    t.integer  "task_done"
    t.integer  "task_total"
    t.boolean  "ready"
    t.integer  "leader_id"
    t.integer  "office_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_templates", force: true do |t|
    t.string   "name"
    t.string   "due_date"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.string   "due_date"
    t.boolean  "completed"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
