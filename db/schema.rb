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

ActiveRecord::Schema.define(version: 20171119031822) do

  create_table "attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "work_started_at"
    t.datetime "work_stopped_at"
    t.datetime "break_started_at"
    t.datetime "break_stopped_at"
    t.integer "num_of_edit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_attendances_on_company_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "colors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "main"
    t.string "bg"
    t.string "grad_1"
    t.string "grad_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "hp_addr"
    t.string "home_photo_url", default: "home.png"
    t.string "icon_photo_url", default: "pf.jpg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.bigint "color_id"
    t.string "association_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_company_users_on_color_id"
    t.index ["company_id"], name: "index_company_users_on_company_id"
    t.index ["user_id"], name: "index_company_users_on_user_id"
  end

  create_table "goal_notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "goal_id"
    t.bigint "notice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_goal_notices_on_goal_id"
    t.index ["notice_id"], name: "index_goal_notices_on_notice_id"
  end

  create_table "goal_stamps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "goal_id"
    t.bigint "stamp_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_goal_stamps_on_goal_id"
    t.index ["stamp_id"], name: "index_goal_stamps_on_stamp_id"
    t.index ["user_id"], name: "index_goal_stamps_on_user_id"
  end

  create_table "goal_todos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "goal_id"
    t.bigint "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_goal_todos_on_goal_id"
    t.index ["todo_id"], name: "index_goal_todos_on_todo_id"
  end

  create_table "goals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.string "title"
    t.text "detail"
    t.integer "span"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_goals_on_company_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "labels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "company_id"
    t.string "name"
    t.string "color"
    t.integer "counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_labels_on_company_id"
  end

  create_table "notice_companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "notice_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_notice_companies_on_company_id"
    t.index ["notice_id"], name: "index_notice_companies_on_notice_id"
  end

  create_table "notice_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "notice_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notice_id"], name: "index_notice_users_on_notice_id"
    t.index ["user_id"], name: "index_notice_users_on_user_id"
  end

  create_table "notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "body"
    t.string "associate_type"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "report_id"
    t.bigint "notice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notice_id"], name: "index_report_notices_on_notice_id"
    t.index ["report_id"], name: "index_report_notices_on_report_id"
  end

  create_table "report_stamps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "report_id"
    t.bigint "stamp_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_report_stamps_on_report_id"
    t.index ["stamp_id"], name: "index_report_stamps_on_stamp_id"
    t.index ["user_id"], name: "index_report_stamps_on_user_id"
  end

  create_table "report_todos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "report_id"
    t.bigint "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_report_todos_on_report_id"
    t.index ["todo_id"], name: "index_report_todos_on_todo_id"
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.bigint "schedule_id"
    t.datetime "work_started_at"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_reports_on_company_id"
    t.index ["schedule_id"], name: "index_reports_on_schedule_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "schedule_todos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "schedule_id"
    t.bigint "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_schedule_todos_on_schedule_id"
    t.index ["todo_id"], name: "index_schedule_todos_on_todo_id"
  end

  create_table "schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "work_started_at"
    t.datetime "work_ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_schedules_on_company_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "stamps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_labels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "task_id"
    t.bigint "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_task_labels_on_label_id"
    t.index ["task_id"], name: "index_task_labels_on_task_id"
  end

  create_table "task_notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "task_id"
    t.bigint "notice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notice_id"], name: "index_task_notices_on_notice_id"
    t.index ["task_id"], name: "index_task_notices_on_task_id"
  end

  create_table "task_schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "task_id"
    t.bigint "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_task_schedules_on_schedule_id"
    t.index ["task_id"], name: "index_task_schedules_on_task_id"
  end

  create_table "task_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "task_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_users_on_task_id"
    t.index ["user_id"], name: "index_task_users_on_user_id"
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "company_id"
    t.string "title"
    t.text "detail"
    t.integer "status_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tasks_on_company_id"
  end

  create_table "todo_companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "todo_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_todo_companies_on_company_id"
    t.index ["todo_id"], name: "index_todo_companies_on_todo_id"
  end

  create_table "todo_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "todo_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_todo_users_on_todo_id"
    t.index ["user_id"], name: "index_todo_users_on_user_id"
  end

  create_table "todos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "body"
    t.string "associate_type"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "university"
    t.integer "grade"
    t.string "department"
    t.string "position"
    t.boolean "gender"
    t.date "birthday"
    t.string "profile_photo_url", default: "pf.jpg"
    t.string "home_photo_url", default: "home.jpg"
    t.boolean "employment_status"
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.string "meta"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attendances", "companies"
  add_foreign_key "attendances", "users"
  add_foreign_key "company_users", "colors"
  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "goal_notices", "goals"
  add_foreign_key "goal_notices", "notices"
  add_foreign_key "goal_stamps", "goals"
  add_foreign_key "goal_stamps", "stamps"
  add_foreign_key "goal_stamps", "users"
  add_foreign_key "goal_todos", "goals"
  add_foreign_key "goal_todos", "todos"
  add_foreign_key "goals", "companies"
  add_foreign_key "goals", "users"
  add_foreign_key "labels", "companies"
  add_foreign_key "notice_companies", "companies"
  add_foreign_key "notice_companies", "notices"
  add_foreign_key "notice_users", "notices"
  add_foreign_key "notice_users", "users"
  add_foreign_key "report_notices", "notices"
  add_foreign_key "report_notices", "reports"
  add_foreign_key "report_stamps", "reports"
  add_foreign_key "report_stamps", "stamps"
  add_foreign_key "report_stamps", "users"
  add_foreign_key "report_todos", "reports"
  add_foreign_key "report_todos", "todos"
  add_foreign_key "reports", "companies"
  add_foreign_key "reports", "schedules"
  add_foreign_key "reports", "users"
  add_foreign_key "schedule_todos", "schedules"
  add_foreign_key "schedule_todos", "todos"
  add_foreign_key "schedules", "companies"
  add_foreign_key "schedules", "users"
  add_foreign_key "task_labels", "labels"
  add_foreign_key "task_labels", "tasks"
  add_foreign_key "task_notices", "notices"
  add_foreign_key "task_notices", "tasks"
  add_foreign_key "task_schedules", "schedules"
  add_foreign_key "task_schedules", "tasks"
  add_foreign_key "task_users", "tasks"
  add_foreign_key "task_users", "users"
  add_foreign_key "tasks", "companies"
  add_foreign_key "todo_companies", "companies"
  add_foreign_key "todo_companies", "todos"
  add_foreign_key "todo_users", "todos"
  add_foreign_key "todo_users", "users"
end
