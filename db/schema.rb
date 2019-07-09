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

ActiveRecord::Schema.define(version: 20190702082849) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "bugreasons", force: :cascade do |t|
    t.string   "bugdescriptionstring"
    t.integer  "bugorder"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "categoryfiles", force: :cascade do |t|
    t.string   "categoryfilestring"
    t.integer  "categoryfileorder"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "categoryprojects", force: :cascade do |t|
    t.string   "categoryprojectstring"
    t.integer  "categoryprojectorder"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "customerlists", force: :cascade do |t|
    t.string   "companyname"
    t.string   "engineeremail"
    t.integer  "customerorder"
    t.text     "companydescription"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "downloadcetres", force: :cascade do |t|
    t.string   "dwnprojectcode"
    t.string   "dwnfilename"
    t.integer  "dwnfilemajorver"
    t.integer  "dwnfilemiddlever"
    t.integer  "dwnfileminorver"
    t.integer  "projectcontrol_id"
    t.integer  "releasecenter_id"
    t.integer  "user_id"
    t.integer  "releasefile_id"
    t.string   "dwnfiledescription"
    t.boolean  "dwndownloadfinished"
    t.datetime "dwnfinishedtime"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "hwplatforms", force: :cascade do |t|
    t.string   "hwnickname"
    t.string   "hwcode"
    t.string   "hwmajorversion"
    t.integer  "hwminorversion"
    t.integer  "hworder"
    t.text     "hwdescription"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "issueboards", force: :cascade do |t|
    t.integer  "projectcontrol_id"
    t.string   "issuesummary"
    t.text     "issuedescription"
    t.integer  "status_id"
    t.integer  "reporter_id"
    t.integer  "assignedto_id"
    t.integer  "customerlist_id"
    t.string   "cclist"
    t.integer  "bugreason_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["projectcontrol_id"], name: "index_issueboards_on_projectcontrol_id"
  end

  create_table "osplatforms", force: :cascade do |t|
    t.integer  "categoryproject_id"
    t.string   "osdescribe"
    t.integer  "osorder"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["categoryproject_id"], name: "index_osplatforms_on_categoryproject_id"
  end

  create_table "projectcclists", force: :cascade do |t|
    t.integer  "projectcontrol_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["projectcontrol_id"], name: "index_projectcclists_on_projectcontrol_id"
  end

  create_table "projectcomments", force: :cascade do |t|
    t.integer  "projectcontrol_id"
    t.text     "commentdescription"
    t.integer  "reporter_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["projectcontrol_id"], name: "index_projectcomments_on_projectcontrol_id"
  end

  create_table "projectcontrols", force: :cascade do |t|
    t.string   "projectname",        null: false
    t.string   "projectcode",        null: false
    t.text     "prjdescription",     null: false
    t.string   "cclist"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "osplatform_id"
    t.integer  "hwplatform_id"
    t.integer  "status_id"
    t.integer  "reporter_id"
    t.integer  "assignedto_id"
    t.integer  "customerlist_id"
    t.integer  "categoryproject_id"
    t.integer  "statussolution_id"
    t.index ["assignedto_id"], name: "index_projectcontrols_on_assignedto_id"
    t.index ["categoryproject_id"], name: "index_projectcontrols_on_categoryproject_id"
    t.index ["customerlist_id"], name: "index_projectcontrols_on_customerlist_id"
    t.index ["hwplatform_id"], name: "index_projectcontrols_on_hwplatform_id"
    t.index ["osplatform_id"], name: "index_projectcontrols_on_osplatform_id"
    t.index ["reporter_id"], name: "index_projectcontrols_on_reporter_id"
    t.index ["status_id"], name: "index_projectcontrols_on_status_id"
    t.index ["statussolution_id"], name: "index_projectcontrols_on_statussolution_id"
  end

  create_table "projectfiles", force: :cascade do |t|
    t.integer  "projectcontrol_id"
    t.string   "prjfilename"
    t.text     "prjfiledescription"
    t.boolean  "prjfilevalid"
    t.integer  "reporter_id"
    t.integer  "categoryfile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["projectcontrol_id"], name: "index_projectfiles_on_projectcontrol_id"
  end

  create_table "releasecenters", force: :cascade do |t|
    t.integer  "projectcontrol_id"
    t.string   "releasesummary"
    t.text     "releasedescription"
    t.integer  "reporter_id"
    t.integer  "assignedto_id"
    t.integer  "customerlist_id"
    t.integer  "status_id"
    t.string   "cclist"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["projectcontrol_id"], name: "index_releasecenters_on_projectcontrol_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "statusstring"
    t.integer  "statusorder"
    t.boolean  "statusproject"
    t.boolean  "statusissue"
    t.boolean  "statusrelease"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "statussolutions", force: :cascade do |t|
    t.integer  "status_id"
    t.text     "solutionstring"
    t.integer  "solutionorder"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["status_id"], name: "index_statussolutions_on_status_id"
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
    t.integer  "current_sign_in_ip"
    t.integer  "last_sign_in_ip"
    t.string   "role",                   default: "", null: false
    t.string   "firstname",              default: "", null: false
    t.string   "lastname",               default: "", null: false
    t.integer  "customerlist_id"
    t.boolean  "visible"
    t.string   "description",            default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
