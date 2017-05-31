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

ActiveRecord::Schema.define(version: 20170522070129) do

  create_table "user", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "Table account" do |t|
    t.string   "user_name",  limit: 24,  null: false
    t.string   "password",   limit: 128, null: false
    t.string   "name",       limit: 128
    t.date     "birthday"
    t.datetime "joined_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt",       limit: 128
    t.string   "last_login", limit: 45
    t.integer  "level",      limit: 1
    t.integer  "manager_id"
    t.index ["user_name"], name: "user_name_UNIQUE", unique: true, using: :btree
  end

  create_table "user_component", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci" do |t|
    t.string   "name"
    t.datetime "created_at", comment: "Component"
  end

  create_table "user_module", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci" do |t|
    t.string   "name"
    t.integer  "fk_user_component"
    t.integer  "priority",          limit: 1
    t.datetime "created_at",                  comment: "module"
  end

  create_table "user_resource", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci" do |t|
    t.string  "controller",                            collation: "utf8_general_ci"
    t.integer "active",         limit: 1
    t.integer "display",        limit: 1
    t.integer "fk_user_module",           null: false,                               comment: "Resource"
  end

end
