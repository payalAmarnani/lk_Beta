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

ActiveRecord::Schema.define(version: 20171024123218) do

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ar_internal_metadata", ["key"], name: "sqlite_autoindex_ar_internal_metadata_1", unique: true

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "category_type"
    t.boolean  "hidden"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_transactions", force: :cascade do |t|
    t.integer  "payment_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "order_id"
  end

  add_index "order_transactions", ["order_id"], name: "index_order_transactions_on_order_id"
  add_index "order_transactions", ["payment_id"], name: "index_order_transactions_on_payment_id"

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.integer  "order_status_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id"

  create_table "payments", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "last4"
    t.decimal  "amount",             precision: 12, scale: 3
    t.boolean  "success"
    t.string   "authorization_code"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "order_id"
  end

  add_index "payments", ["order_id"], name: "index_payments_on_order_id"

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "product_name"
    t.decimal  "price",                      precision: 8,  scale: 2
    t.decimal  "stock_level",                precision: 16, scale: 2
    t.string   "supplier_code"
    t.string   "product_code"
    t.text     "short_description"
    t.text     "long_description"
    t.boolean  "active"
    t.boolean  "hidden"
    t.boolean  "new"
    t.boolean  "gst_applicable"
    t.string   "color"
    t.string   "pattern"
    t.string   "season"
    t.string   "occasion"
    t.string   "fabric"
    t.string   "yarn"
    t.string   "buttons"
    t.string   "lining_fabric"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "product_image_file_name"
    t.string   "product_image_content_type"
    t.integer  "product_image_file_size"
    t.datetime "product_image_updated_at"
    t.string   "fabric_image_file_name"
    t.string   "fabric_image_content_type"
    t.integer  "fabric_image_file_size"
    t.datetime "fabric_image_updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"

  create_table "styles", force: :cascade do |t|
    t.integer  "OrderItem_id"
    t.string   "cuff"
    t.string   "collar"
    t.string   "fit"
    t.string   "length_type"
    t.string   "contrastCollarCuff"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "styles", ["OrderItem_id"], name: "index_styles_on_OrderItem_id"

end
