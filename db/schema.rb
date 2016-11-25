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

ActiveRecord::Schema.define(version: 20161124154738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "job_question_answer"
    t.integer  "extra_question_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "answers", ["extra_question_id"], name: "index_answers_on_extra_question_id", using: :btree

  create_table "apply_jobs", force: :cascade do |t|
    t.text     "apply_job_info"
    t.decimal  "price_per_hour"
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "apply_jobs", ["job_id"], name: "index_apply_jobs_on_job_id", using: :btree
  add_index "apply_jobs", ["user_id"], name: "index_apply_jobs_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificates", force: :cascade do |t|
    t.string   "certificate_name"
    t.string   "certificate_publisher"
    t.string   "certificate_publish_date"
    t.text     "certificate_description"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "certificates", ["user_id"], name: "index_certificates_on_user_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "company_name"
    t.text     "company_about_us"
    t.string   "company_address_street"
    t.string   "company_address_city"
    t.string   "company_address_zip"
    t.string   "company_address_country"
    t.string   "company_invoice_address_street"
    t.string   "company_invoice_address_city"
    t.string   "company_invoice_address_zip"
    t.string   "company_invoice_address_country"
    t.string   "company_invoice_reference"
    t.string   "company_invoice_email"
    t.string   "company_contact_person_first_name"
    t.string   "company_contact_person_last_name"
    t.string   "company_contact_person_cell_phone"
    t.string   "company_contact_person_phone_no"
    t.string   "company_contact_person_email"
    t.boolean  "right_of_hiring"
    t.boolean  "is_active"
    t.integer  "user_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "company_number"
    t.boolean  "company_ftex"
    t.string   "company_web_address"
    t.string   "company_logo"
    t.string   "company_invoice_address_street2"
    t.string   "company_state",                     default: "review"
    t.string   "invoice_person_name"
    t.string   "invoice_person_name_phone_number"
    t.string   "category_name"
    t.string   "company_phone_number"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "company_categories", force: :cascade do |t|
    t.string   "category_name"
    t.integer  "company_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "company_categories", ["company_id"], name: "index_company_categories_on_company_id", using: :btree

  create_table "competences", force: :cascade do |t|
    t.string   "competence_name"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "competences", ["user_id"], name: "index_competences_on_user_id", using: :btree

  create_table "driving_licenses", force: :cascade do |t|
    t.boolean  "dl_am"
    t.boolean  "dl_aa"
    t.boolean  "dl_a2"
    t.boolean  "dl_a"
    t.boolean  "dl_b"
    t.boolean  "dl_be"
    t.boolean  "dl_c"
    t.boolean  "dl_c1"
    t.boolean  "dl_ce"
    t.boolean  "dl_c1e"
    t.boolean  "dl_d"
    t.boolean  "dl_d1"
    t.boolean  "dl_de"
    t.boolean  "dl_d1e"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "driving_licenses", ["user_id"], name: "index_driving_licenses_on_user_id", using: :btree

  create_table "educations", force: :cascade do |t|
    t.string   "education_title"
    t.string   "education_school_name"
    t.string   "education_date_from"
    t.string   "education_date_to"
    t.text     "education_description"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "educations", ["user_id"], name: "index_educations_on_user_id", using: :btree

  create_table "eq_answers", force: :cascade do |t|
    t.string   "job_question_answer"
    t.integer  "extra_question_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "eq_answers", ["extra_question_id"], name: "index_eq_answers_on_extra_question_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.string   "experience_company_name"
    t.string   "experience_title"
    t.string   "experience_date_from"
    t.string   "experience_date_to"
    t.boolean  "experience_i_am_work_here"
    t.string   "experience_branch"
    t.text     "experience_description"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id", using: :btree

  create_table "extra_questions", force: :cascade do |t|
    t.text     "job_question"
    t.integer  "job_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "extra_questions", ["job_id"], name: "index_extra_questions_on_job_id", using: :btree

  create_table "hobbies", force: :cascade do |t|
    t.string   "hobby_icon"
    t.string   "hobby_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hobbies", ["user_id"], name: "index_hobbies_on_user_id", using: :btree

  create_table "job_applications", force: :cascade do |t|
    t.text     "apply_job_info"
    t.decimal  "price_per_hour"
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "job_applications", ["job_id"], name: "index_job_applications_on_job_id", using: :btree
  add_index "job_applications", ["user_id"], name: "index_job_applications_on_user_id", using: :btree

  create_table "job_requirements", force: :cascade do |t|
    t.string   "requirement_name"
    t.integer  "job_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "job_requirements", ["job_id"], name: "index_job_requirements_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "job_name"
    t.text     "job_discription"
    t.string   "job_hire_type"
    t.string   "job_last_date_to_apply"
    t.string   "job_place_city"
    t.string   "job_place_town"
    t.text     "job_questions"
    t.integer  "company_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "job_status",                 default: "review"
    t.string   "job_type"
    t.string   "job_category"
    t.text     "job_tasks"
    t.integer  "job_workers_needed"
    t.boolean  "job_hire_in_house"
    t.integer  "job_gfl"
    t.string   "job_company_index"
    t.string   "job_company_description"
    t.string   "job_company_address"
    t.string   "job_company_address_zip"
    t.string   "job_company_address_city"
    t.string   "job_consultant_type"
    t.string   "job_start_time"
    t.integer  "job_consultant_duration"
    t.string   "job_consultant_repeat_type"
    t.integer  "job_consultant_repeat_days"
    t.float    "job_price_per_hour"
    t.float    "job_total_cost_per_person"
    t.boolean  "accept_agreement"
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "language_name"
    t.string   "language_skill"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "languages", ["user_id"], name: "index_languages_on_user_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "prices", force: :cascade do |t|
    t.decimal  "amount",      default: 350.0, null: false
    t.integer  "company_id"
    t.integer  "category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "prices", ["category_id"], name: "index_prices_on_category_id", using: :btree
  add_index "prices", ["company_id"], name: "index_prices_on_company_id", using: :btree

  create_table "saved_jobs", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "saved_jobs", ["job_id"], name: "index_saved_jobs_on_job_id", using: :btree
  add_index "saved_jobs", ["user_id"], name: "index_saved_jobs_on_user_id", using: :btree

  create_table "user_compentences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "competence_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_compentences", ["competence_id"], name: "index_user_compentences_on_competence_id", using: :btree
  add_index "user_compentences", ["user_id"], name: "index_user_compentences_on_user_id", using: :btree

  create_table "user_competences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "competence_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "competence_level"
  end

  add_index "user_competences", ["competence_id"], name: "index_user_competences_on_competence_id", using: :btree
  add_index "user_competences", ["user_id"], name: "index_user_competences_on_user_id", using: :btree

  create_table "user_job_categories", force: :cascade do |t|
    t.boolean  "administrative"
    t.boolean  "brand_ambassador"
    t.boolean  "customer_service"
    t.boolean  "data_entry"
    t.boolean  "delivery"
    t.boolean  "event_staff"
    t.boolean  "warehousing"
    t.boolean  "general_labor"
    t.boolean  "market_research"
    t.boolean  "marketing"
    t.boolean  "merchandising"
    t.boolean  "sales"
    t.boolean  "software_testing"
    t.boolean  "volunteer"
    t.boolean  "washing"
    t.boolean  "other"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "user_job_categories", ["user_id"], name: "index_user_job_categories_on_user_id", using: :btree

  create_table "user_job_types", force: :cascade do |t|
    t.boolean  "hire"
    t.boolean  "consultant"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_job_types", ["user_id"], name: "index_user_job_types_on_user_id", using: :btree

  create_table "user_providers", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_providers", ["user_id"], name: "index_user_providers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                   default: "",    null: false
    t.string   "encrypted_password",      default: "",    null: false
    t.boolean  "is_company",              default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "user_name"
    t.string   "image_url"
    t.text     "about_me"
    t.string   "video_url"
    t.integer  "user_profile_progress",   default: 0,     null: false
    t.string   "user_address_street"
    t.string   "user_address_zip"
    t.string   "user_address_city"
    t.string   "user_bank_account_no"
    t.string   "user_cell_phone"
    t.string   "user_phone_no"
    t.string   "user_first_name"
    t.string   "user_last_name"
    t.string   "user_gender"
    t.boolean  "user_freelancer_company"
    t.string   "user_company_number"
    t.string   "user_company_name"
    t.integer  "user_account_progress",   default: 0,     null: false
    t.integer  "user_company_progress",   default: 0,     null: false
    t.string   "user_personal_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "extra_questions"
  add_foreign_key "apply_jobs", "jobs"
  add_foreign_key "apply_jobs", "users"
  add_foreign_key "certificates", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "company_categories", "companies"
  add_foreign_key "competences", "users"
  add_foreign_key "driving_licenses", "users"
  add_foreign_key "educations", "users"
  add_foreign_key "eq_answers", "extra_questions"
  add_foreign_key "experiences", "users"
  add_foreign_key "extra_questions", "jobs"
  add_foreign_key "hobbies", "users"
  add_foreign_key "job_applications", "jobs"
  add_foreign_key "job_applications", "users"
  add_foreign_key "job_requirements", "jobs"
  add_foreign_key "jobs", "companies"
  add_foreign_key "languages", "users"
  add_foreign_key "prices", "categories"
  add_foreign_key "prices", "companies"
  add_foreign_key "saved_jobs", "jobs"
  add_foreign_key "saved_jobs", "users"
  add_foreign_key "user_compentences", "competences"
  add_foreign_key "user_compentences", "users"
  add_foreign_key "user_competences", "competences"
  add_foreign_key "user_competences", "users"
  add_foreign_key "user_job_categories", "users"
  add_foreign_key "user_job_types", "users"
  add_foreign_key "user_providers", "users"
end
