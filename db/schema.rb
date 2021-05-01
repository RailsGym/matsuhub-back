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

ActiveRecord::Schema.define(version: 2021_05_01_062041) do

  create_table "areas", charset: "utf8mb4", force: :cascade do |t|
    t.string "description", null: false
    t.string "area_type", null: false
    t.string "area_type_text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "canvas", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_canvas_on_owner_id"
  end

  create_table "canvas_members", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "canvas_id", null: false
    t.bigint "user_id", null: false
    t.string "authority", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["canvas_id", "user_id"], name: "index_canvas_members_on_canvas_id_and_user_id", unique: true
  end

  create_table "labels", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "area_id", null: false
    t.bigint "canvas_id", null: false
    t.bigint "created_user_id", null: false
    t.bigint "updated_user_id"
    t.string "title", null: false
    t.string "description"
    t.integer "position", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id", "canvas_id", "position"], name: "index_labels_on_area_id_and_canvas_id_and_position", unique: true
    t.index ["area_id"], name: "index_labels_on_area_id"
    t.index ["canvas_id"], name: "index_labels_on_canvas_id"
    t.index ["created_user_id"], name: "index_labels_on_created_user_id"
    t.index ["updated_user_id"], name: "index_labels_on_updated_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
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
    t.string "name"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "canvas", "users", column: "owner_id"
  add_foreign_key "labels", "users", column: "created_user_id"
  add_foreign_key "labels", "users", column: "updated_user_id"
end
