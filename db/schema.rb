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

ActiveRecord::Schema[7.2].define(version: 2024_10_08_190720) do
  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.integer "venue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_attractions_on_venue_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companyables", force: :cascade do |t|
    t.integer "companyable_id"
    t.string "companyable_type"
    t.integer "model_id"
    t.integer "submodel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id", null: false
    t.index ["company_id"], name: "index_companyables_on_company_id"
    t.index ["model_id"], name: "index_companyables_on_model_id"
    t.index ["submodel_id"], name: "index_companyables_on_submodel_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_models_on_company_id"
  end

  create_table "submodels", force: :cascade do |t|
    t.string "name"
    t.integer "model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_submodels_on_model_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attractions", "venues"
  add_foreign_key "companyables", "companies"
  add_foreign_key "companyables", "models"
  add_foreign_key "companyables", "submodels"
  add_foreign_key "models", "companies"
  add_foreign_key "submodels", "models"
end
