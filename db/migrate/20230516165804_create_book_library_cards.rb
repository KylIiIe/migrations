class CreateBookLibraryCards < ActiveRecord::Migration[7.0]
  def change
    create_table :book_library_cards do |t|
      t.integer :library_card_id
      t.integer :book_id
      t.timestamps
    end
  end
end
