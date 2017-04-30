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

ActiveRecord::Schema.define(version: 20170429132527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "permissions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "action"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.string   "uuid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["uuid"], name: "index_permissions_on_uuid", unique: true, using: :btree
  end

  create_table "permissions_roles", id: false, force: :cascade do |t|
    t.integer "role_id",       null: false
    t.integer "permission_id", null: false
    t.index ["permission_id", "role_id"], name: "index_permissions_roles_on_permission_id_and_role_id", using: :btree
    t.index ["role_id", "permission_id"], name: "index_permissions_roles_on_role_id_and_permission_id", using: :btree
    t.index ["role_id", "permission_id"], name: "role_permission_uniqueness", unique: true, using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "uuid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["uuid"], name: "index_roles_on_uuid", unique: true, using: :btree
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", using: :btree
    t.index ["role_id", "user_id"], name: "role_user_uniqueness", unique: true, using: :btree
    t.index ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name",              default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
