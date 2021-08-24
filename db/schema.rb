# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_08_23_123052) do
=======
ActiveRecord::Schema.define(version: 2021_08_23_130049) do
>>>>>>> 93bf2f40284d06605e17ddbace0c922e74a06583
=======
ActiveRecord::Schema.define(version: 2021_08_24_101036) do
>>>>>>> 5029e1faa1724a1a3982e00f564bb7925a6b80a9

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shifts", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.bigint "manager_id", null: false
    t.integer "runner_needed"
    t.integer "padder_needed"
    t.integer "barman_needed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manager_id"], name: "index_shifts_on_manager_id"
  end

<<<<<<< HEAD
  create_table "shifts", force: :cascade do |t|
    t.date "started_at"
    t.date "ended_at"
<<<<<<< HEAD
    t.string "post"
    t.string "status"
    t.bigint "entities_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entities_id"], name: "index_shifts_on_entities_id"
  end

  add_foreign_key "shifts", "entities", column: "entities_id"
=======
=======
  create_table "user_shifts", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "shift_id", null: false
>>>>>>> 5029e1faa1724a1a3982e00f564bb7925a6b80a9
    t.string "job"
    t.integer "hours_worked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_user_shifts_on_employee_id"
    t.index ["shift_id"], name: "index_user_shifts_on_shift_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", null: false
    t.string "jobs"
    t.integer "contract_hours_per_week"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

<<<<<<< HEAD
  add_foreign_key "shifts", "entities"
  add_foreign_key "users", "entities"
>>>>>>> 93bf2f40284d06605e17ddbace0c922e74a06583
=======
  add_foreign_key "shifts", "users", column: "manager_id"
  add_foreign_key "user_shifts", "shifts"
  add_foreign_key "user_shifts", "users", column: "employee_id"
>>>>>>> 5029e1faa1724a1a3982e00f564bb7925a6b80a9
end
