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

ActiveRecord::Schema.define(version: 20161219052549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "encrypters", force: :cascade do |t|
    t.text     "description"
    t.integer  "speed"
    t.date     "expiration"
    t.integer  "test_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "expirationEmail", default: false
    t.string   "serialNum"
  end

  create_table "lab_approvals", force: :cascade do |t|
    t.boolean  "approved",   default: false
    t.integer  "lab_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "labs", force: :cascade do |t|
    t.string   "name"
    t.date     "accredDate"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "mgr_id"
    t.date     "loa_Expiration"
    t.boolean  "accredDateEmail",           default: false
    t.boolean  "loaExpirationEmail",        default: false
    t.string   "accrediation_file_name"
    t.string   "accrediation_content_type"
    t.integer  "accrediation_file_size"
    t.datetime "accrediation_updated_at"
    t.string   "loa_file_name"
    t.string   "loa_content_type"
    t.integer  "loa_file_size"
    t.datetime "loa_updated_at"
  end

  create_table "networks", force: :cascade do |t|
    t.string   "classification"
    t.string   "pocName"
    t.string   "pocNumber"
    t.date     "experationDate"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "routers", force: :cascade do |t|
    t.string   "serialNum"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "numPorts"
    t.integer  "test_id"
  end

  create_table "system_approvals", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "iaApproved"
    t.boolean  "atoApproved"
    t.integer  "system_id"
    t.boolean  "atoEmail",    default: false
    t.boolean  "aiEmail",     default: false
  end

  create_table "systems", force: :cascade do |t|
    t.string   "name"
    t.date     "ato_Expiration"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "lab_id"
    t.boolean  "atoExpirationEmail",  default: false
    t.string   "atoDoc_file_name"
    t.string   "atoDoc_content_type"
    t.integer  "atoDoc_file_size"
    t.datetime "atoDoc_updated_at"
  end

  create_table "test_approvals", force: :cascade do |t|
    t.boolean  "approved"
    t.integer  "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "network_id"
    t.integer  "system_id"
    t.boolean  "endEmail",                    default: false
    t.boolean  "startEmail",                  default: false
    t.string   "allLabMoA_file_name"
    t.string   "allLabMoA_content_type"
    t.integer  "allLabMoA_file_size"
    t.datetime "allLabMoA_updated_at"
    t.string   "testProcedures_file_name"
    t.string   "testProcedures_content_type"
    t.integer  "testProcedures_file_size"
    t.datetime "testProcedures_updated_at"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "ia_admin",               default: false
    t.boolean  "it_admin",               default: false
    t.integer  "lab_id"
    t.boolean  "customer",               default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
