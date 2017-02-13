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

ActiveRecord::Schema.define(version: 20170202173111) do

  create_table "coordinators", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "coordinator_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "start"
    t.date     "end"
    t.index ["coordinator_id"], name: "index_enrollments_on_coordinator_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "start"
    t.date     "end"
    t.index ["student_id"], name: "index_matches_on_student_id"
    t.index ["tutor_id"], name: "index_matches_on_tutor_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutors", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "affiliate"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "cell_phone"
    t.string   "gender"
    t.string   "native_language"
    t.string   "race"
    t.string   "training_type"
    t.string   "referral"
    t.string   "education"
    t.string   "employment"
    t.string   "occupation"
    t.date     "orientation"
    t.date     "training"
    t.date     "dob"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role",                   default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "volunteer_jobs", force: :cascade do |t|
    t.integer  "tutor_id"
    t.integer  "coordinator_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "start"
    t.date     "end"
    t.index ["coordinator_id"], name: "index_volunteer_jobs_on_coordinator_id"
    t.index ["tutor_id"], name: "index_volunteer_jobs_on_tutor_id"
  end

end
