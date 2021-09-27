class InitSchema < ActiveRecord::Migration
  def up
    create_table "admins" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_admins_on_email", unique: true
      t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    end
    create_table "cart_items" do |t|
      t.integer "customer_id", null: false
      t.integer "item_id", null: false
      t.integer "quantity", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "customers" do |t|
      t.boolean "is_enabled", default: true, null: false
      t.string "last_name", default: "", null: false
      t.string "first_name", default: "", null: false
      t.string "last_name_kana", default: "", null: false
      t.string "first_name_kana", default: "", null: false
      t.string "phone_number", default: "", null: false
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "post_code", default: "", null: false
      t.text "address", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_customers_on_email", unique: true
      t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
    end
    create_table "genres" do |t|
      t.string "name", default: "", null: false
      t.boolean "is_enabled", default: true, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "items" do |t|
      t.integer "genre_id", null: false
      t.string "image_id"
      t.string "name", default: "", null: false
      t.text "description"
      t.integer "price", null: false
      t.integer "sale_status", default: 1, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["genre_id"], name: "index_items_on_genre_id"
    end
    create_table "order_details" do |t|
      t.integer "order_id", null: false
      t.string "item_name", default: "", null: false
      t.integer "item_price", null: false
      t.integer "quantity", null: false
      t.integer "item_status", default: 0, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "orders" do |t|
      t.integer "customer_id", null: false
      t.string "last_name", default: "", null: false
      t.string "first_name", default: "", null: false
      t.string "post_code", default: "", null: false
      t.text "address", default: "", null: false
      t.integer "payment", null: false
      t.integer "carriage", default: 800, null: false
      t.integer "total_price", null: false
      t.integer "order_status", default: 0, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "ship_addresses" do |t|
      t.integer "customer_id", null: false
      t.string "last_name", default: "", null: false
      t.string "first_name", default: "", null: false
      t.string "post_code", default: "", null: false
      t.text "address", default: "", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
