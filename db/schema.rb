# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_22_210150) do

  create_table "acompanhamentos", force: :cascade do |t|
    t.string "medicamento"
    t.integer "tipo_id"
    t.datetime "inicio_tratamento"
    t.datetime "fim_tratamento"
    t.string "paciente"
    t.integer "idade"
    t.integer "genero_id"
    t.string "medico"
    t.string "crm"
    t.text "finalidade"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cid_id"
  end

  create_table "administracaos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cids", force: :cascade do |t|
    t.string "codigo"
    t.string "doenca"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diarios", force: :cascade do |t|
    t.integer "acompanhamento_id"
    t.string "dosagem"
    t.integer "administracao_id"
    t.date "data"
    t.text "anotacoes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "efeitocolaterals", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "efeitodiarios", force: :cascade do |t|
    t.integer "diario_id"
    t.integer "efeitocolateral_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "generos", force: :cascade do |t|
    t.string "genero"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "imagen"
    t.string "nombre"
    t.string "descripcion"
    t.integer "existencia"
    t.decimal "precio"
    t.integer "category_id"
    t.integer "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "foto"
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.string "ciudad"
    t.string "estado"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "sale_details", force: :cascade do |t|
    t.integer "cantidad"
    t.integer "product_id"
    t.integer "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sale_details_on_product_id"
    t.index ["sale_id"], name: "index_sale_details_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.decimal "importe"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.index ["client_id"], name: "index_sales_on_client_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouse_details", force: :cascade do |t|
    t.integer "cantidad"
    t.integer "product_id"
    t.integer "warehouse_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_warehouse_details_on_product_id"
    t.index ["warehouse_record_id"], name: "index_warehouse_details_on_warehouse_record_id"
  end

  create_table "warehouse_records", force: :cascade do |t|
    t.integer "cantidad"
    t.integer "user_id"
    t.integer "supplier_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_warehouse_records_on_product_id"
    t.index ["supplier_id"], name: "index_warehouse_records_on_supplier_id"
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "suppliers"
  add_foreign_key "profiles", "users"
  add_foreign_key "sale_details", "products"
  add_foreign_key "sale_details", "sales"
  add_foreign_key "sales", "clients"
  add_foreign_key "warehouse_details", "products"
  add_foreign_key "warehouse_details", "warehouse_records"
  add_foreign_key "warehouse_records", "products"
  add_foreign_key "warehouse_records", "suppliers"
end
