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

ActiveRecord::Schema[7.0].define(version: 2023_06_04_120038) do
  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id", null: false
    t.index ["author_id"], name: "index_authors_books_on_author_id"
    t.index ["book_id"], name: "index_authors_books_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.date "year"
    t.integer "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "books_genres", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "index_books_genres_on_book_id"
    t.index ["genre_id"], name: "index_books_genres_on_genre_id"
  end

  create_table "books_library_cards", force: :cascade do |t|
    t.integer "library_card_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "index_books_library_cards_on_book_id"
    t.index ["library_card_id"], name: "index_books_library_cards_on_library_card_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "year_of_creation"
    t.string "street"
    t.string "city"
    t.string "zip_code"
  end

  create_table "library_cards", force: :cascade do |t|
    t.integer "number"
    t.integer "user_id", null: false
    t.integer "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_library_cards_on_library_id"
    t.index ["user_id"], name: "index_library_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "authors_books", "authors"
  add_foreign_key "authors_books", "books"
  add_foreign_key "books", "libraries"
  add_foreign_key "books_genres", "books"
  add_foreign_key "books_genres", "genres"
  add_foreign_key "books_library_cards", "books"
  add_foreign_key "books_library_cards", "library_cards"
  add_foreign_key "library_cards", "libraries"
  add_foreign_key "library_cards", "users"
end
