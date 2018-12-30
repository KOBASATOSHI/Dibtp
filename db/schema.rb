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

ActiveRecord::Schema.define(version: 20181230054115) do

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
    t.integer "order_number", limit: 2
    t.integer "parent_order", limit: 2
    t.integer "to_do_type", limit: 1
    t.integer "deadline_days", limit: 2
    t.integer "to_do_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["to_do_group_id"], name: "index_to_do_masters_on_to_do_group_id"
  end

  create_table "to_dos", force: :cascade do |t|
    t.boolean "done", default: false, null: false
    t.date "deadline"
    t.integer "count"
    t.text "note"
    t.integer "to_do_master_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "start_count", limit: 2
    t.index ["to_do_master_id"], name: "index_to_dos_on_to_do_master_id"
    t.index ["user_id"], name: "index_to_dos_on_user_id"
  end

  create_table "user_to_do_groups", force: :cascade do |t|
    t.integer "to_do_group_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false, null: false
    t.integer "start_count", limit: 2
    t.index ["to_do_group_id"], name: "index_user_to_do_groups_on_to_do_group_id"
    t.index ["user_id"], name: "index_user_to_do_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "remember_created_at"
    t.string "remember_token"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

end
