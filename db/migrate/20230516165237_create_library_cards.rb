class CreateLibraryCards < ActiveRecord::Migration[7.0]
  def change
    create_table :library_cards do |t|
      t.integer :number
      t.references :user, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true
      t.timestamps
    end
  end
end
