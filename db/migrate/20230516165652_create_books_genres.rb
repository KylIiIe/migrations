class CreateBooksGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :books_genres do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
    end
  end
end
