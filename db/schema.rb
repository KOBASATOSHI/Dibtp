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

ActiveRecord::Schema.define(version: 20181201095509) do

  create_table "task_masters", force: :cascade do |t|
    t.integer "category"
    t.string "name"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deleted", default: false
    t.date "deleted_at"
    t.index ["id"], name: "index_task_masters_on_id"
  end

  create_table "to_do_groups", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.boolean "deleted", default: false, null: false
    t.date "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "to_do_masters", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.integer "order", limit: 2
    t.integer "parent_order", limit: 2
    t.integer "to_do_type", limit: 1
    t.integer "deadline_days", limit: 2
    t.integer "to_do_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["to_do_group_id"], name: "index_to_do_masters_on_to_do_group_id"
  end

  create_table "user_task_masters", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deleted", default: false
    t.date "deleted_at"
    t.index ["task_master_id"], name: "index_user_task_masters_on_task_master_id"
    t.index ["user_id"], name: "index_user_task_masters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_users_on_id"
  end

end
