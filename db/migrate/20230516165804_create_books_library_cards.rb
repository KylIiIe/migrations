class CreateBooksLibraryCards < ActiveRecord::Migration[7.0]
  def change
    create_table :books_library_cards do |t|
      t.references :library_card, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
    end
  end
end
