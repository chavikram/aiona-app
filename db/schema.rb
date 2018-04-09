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

ActiveRecord::Schema.define(version: 20161128092609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_master", id: false, force: :cascade do |t|
    t.integer "id",                  default: "nextval('admin_master_id_seq'::regclass)", null: false
    t.string  "username", limit: 20
    t.string  "password", limit: 50
  end

  create_table "ainoa_payment_details", id: false, force: :cascade do |t|
    t.integer "id",                      default: "nextval('ainoa_payment_details_id_seq'::regclass)", null: false
    t.decimal "empcode"
    t.decimal "memberid"
    t.string  "payment_mode", limit: 1
    t.decimal "amount"
    t.string  "remark",       limit: 20
  end

  create_table "aj", id: false, force: :cascade do |t|
    t.integer "id",      default: "nextval('aj_id_seq'::regclass)", null: false
    t.decimal "empcode"
  end

  create_table "antidating_details", id: false, force: :cascade do |t|
    t.integer "id",                              default: "nextval('antidating_details_id_seq'::regclass)", null: false
    t.decimal "empcode"
    t.string  "empname",             limit: 70
    t.date    "doj_nic"
    t.string  "join_grade",          limit: 50
    t.decimal "desigcode"
    t.date    "date_superannuation"
    t.string  "resid_address",       limit: 100
  end

  create_table "candidates", force: :cascade do |t|
    t.integer  "honorific_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "emp_code"
    t.string   "ainoa_membership_no"
    t.integer  "designation_id"
    t.date     "superannuation_date"
    t.string   "office_address1"
    t.string   "office_address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "office_tel_no"
    t.string   "mobile_no"
    t.string   "res_tel_no"
    t.string   "email"
    t.date     "signing_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "nomination_id"
    t.string   "place_of_posting"
  end

  add_index "candidates", ["designation_id"], name: "index_candidates_on_designation_id", using: :btree
  add_index "candidates", ["honorific_id"], name: "index_candidates_on_honorific_id", using: :btree
  add_index "candidates", ["nomination_id"], name: "index_candidates_on_nomination_id", using: :btree
  add_index "candidates", ["state_id"], name: "index_candidates_on_state_id", using: :btree

  create_table "contestantpost_master", id: false, force: :cascade do |t|
    t.integer "id",                     default: "nextval('contestantpost_master_id_seq'::regclass)", null: false
    t.decimal "postid"
    t.string  "postcode",    limit: 2
    t.string  "postname",    limit: 50
    t.string  "active_flag", limit: 1
    t.decimal "postorder"
    t.decimal "max_vote",               default: 0.0
  end

  create_table "contestent_member", id: false, force: :cascade do |t|
    t.integer "id",                     default: "nextval('contestent_member_id_seq'::regclass)", null: false
    t.decimal "empcode"
    t.decimal "postid"
    t.string  "statecode",   limit: 20
    t.decimal "year"
    t.string  "unopposed",   limit: 1
    t.string  "active_flag", limit: 1,  default: "N"
    t.date    "vote_date"
  end

  create_table "desig_master", id: false, force: :cascade do |t|
    t.integer "id",                    default: "nextval('desig_master_id_seq'::regclass)", null: false
    t.decimal "desigcode"
    t.string  "desig_desc", limit: 50
  end

  create_table "designations", force: :cascade do |t|
    t.integer  "code"
    t.string   "title"
    t.string   "short_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sort_order"
  end

  create_table "election_nominations", force: :cascade do |t|
    t.integer  "election_id"
    t.date     "start_date"
    t.datetime "form_issue_date"
    t.datetime "online_filing_start_date"
    t.datetime "online_filing_end_date"
    t.date     "offline_filing_start_date"
    t.date     "offline_filing_end_date"
    t.integer  "online_filing_extended_time"
    t.integer  "offline_filing_extended_days"
    t.integer  "sort_order"
    t.boolean  "deleted"
    t.boolean  "active"
    t.datetime "result_datetime"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "election_nominations", ["election_id"], name: "index_election_nominations_on_election_id", using: :btree

  create_table "election_posts", force: :cascade do |t|
    t.integer  "election_id"
    t.integer  "post_id"
    t.integer  "no_of_post"
    t.integer  "sort_order"
    t.boolean  "deleted"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "state_id"
  end

  add_index "election_posts", ["election_id"], name: "index_election_posts_on_election_id", using: :btree
  add_index "election_posts", ["post_id"], name: "index_election_posts_on_post_id", using: :btree
  add_index "election_posts", ["state_id"], name: "index_election_posts_on_state_id", using: :btree

  create_table "election_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sort_order"
  end

  create_table "elections", force: :cascade do |t|
    t.string   "name"
    t.date     "election_date"
    t.datetime "election_start_time"
    t.datetime "election_end_time"
    t.integer  "extended_time"
    t.integer  "election_type_id"
    t.integer  "sort_order"
    t.boolean  "deleted"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "active"
  end

  add_index "elections", ["election_type_id"], name: "index_elections_on_election_type_id", using: :btree

  create_table "honorifics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "login_member", id: false, force: :cascade do |t|
    t.integer "id",        default: "nextval('login_member_id_seq'::regclass)", null: false
    t.decimal "empcode"
    t.date    "logintime"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.integer  "emp_code"
    t.integer  "designation_code"
    t.integer  "ainoa_membership_no"
    t.string   "state_code"
    t.string   "mobile_no"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members1", force: :cascade do |t|
    t.string  "name",                limit: 60
    t.decimal "emp_code"
    t.decimal "desig_code"
    t.decimal "ainoa_membership_no"
    t.string  "state_code",          limit: 4
    t.string  "mobile_no",           limit: 20
    t.string  "email",               limit: 30
  end

  create_table "nomination_attachments", force: :cascade do |t|
    t.integer  "nomination_id"
    t.string   "attachment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "registration_no"
  end

  add_index "nomination_attachments", ["nomination_id"], name: "index_nomination_attachments_on_nomination_id", using: :btree

  create_table "nominations", force: :cascade do |t|
    t.integer  "election_id"
    t.integer  "state_id"
    t.integer  "candidate_id"
    t.integer  "proposer_id"
    t.boolean  "accept_flag"
    t.date     "filing_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "election_post_id"
    t.string   "avatar"
    t.integer  "registration_no"
  end

  add_index "nominations", ["candidate_id"], name: "index_nominations_on_candidate_id", using: :btree
  add_index "nominations", ["election_id"], name: "index_nominations_on_election_id", using: :btree
  add_index "nominations", ["election_post_id"], name: "index_nominations_on_election_post_id", using: :btree
  add_index "nominations", ["proposer_id"], name: "index_nominations_on_proposer_id", using: :btree
  add_index "nominations", ["state_id"], name: "index_nominations_on_state_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "name"
    t.boolean  "deleted"
    t.integer  "election_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "sort_order"
  end

  add_index "posts", ["election_type_id"], name: "index_posts_on_election_type_id", using: :btree

  create_table "proposers", force: :cascade do |t|
    t.integer  "honorific_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "emp_code"
    t.string   "ainoa_membership_no"
    t.integer  "designation_id"
    t.string   "office_address1"
    t.string   "office_address2"
    t.string   "place_of_posting"
    t.string   "mobile_no"
    t.string   "email"
    t.date     "signing_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "nomination_id"
  end

  add_index "proposers", ["designation_id"], name: "index_proposers_on_designation_id", using: :btree
  add_index "proposers", ["honorific_id"], name: "index_proposers_on_honorific_id", using: :btree
  add_index "proposers", ["nomination_id"], name: "index_proposers_on_nomination_id", using: :btree

  create_table "seconders", force: :cascade do |t|
    t.integer  "honorific_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "emp_code"
    t.string   "ainoa_membership_no"
    t.integer  "designation_id"
    t.string   "office_address1"
    t.string   "office_address2"
    t.string   "place_of_posting"
    t.string   "mobile_no"
    t.string   "email"
    t.date     "signing_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "nomination_id"
  end

  add_index "seconders", ["designation_id"], name: "index_seconders_on_designation_id", using: :btree
  add_index "seconders", ["honorific_id"], name: "index_seconders_on_honorific_id", using: :btree
  add_index "seconders", ["nomination_id"], name: "index_seconders_on_nomination_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "otp_secret_key"
    t.integer  "my_otp_counter"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "avatar"
  end

  add_foreign_key "candidates", "designations"
  add_foreign_key "candidates", "honorifics"
  add_foreign_key "candidates", "nominations"
  add_foreign_key "candidates", "states"
  add_foreign_key "election_nominations", "elections"
  add_foreign_key "election_posts", "elections"
  add_foreign_key "election_posts", "posts"
  add_foreign_key "election_posts", "states"
  add_foreign_key "elections", "election_types"
  add_foreign_key "nomination_attachments", "nominations"
  add_foreign_key "nominations", "candidates"
  add_foreign_key "nominations", "election_posts"
  add_foreign_key "nominations", "elections"
  add_foreign_key "nominations", "proposers"
  add_foreign_key "nominations", "states"
  add_foreign_key "posts", "election_types"
  add_foreign_key "proposers", "designations"
  add_foreign_key "proposers", "honorifics"
  add_foreign_key "proposers", "nominations"
  add_foreign_key "seconders", "designations"
  add_foreign_key "seconders", "honorifics"
  add_foreign_key "seconders", "nominations"
end
