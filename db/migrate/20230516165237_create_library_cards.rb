class CreateLibraryCards < ActiveRecord::Migration[7.0]
  def change
    create_table :library_cards do |t|
      t.integer :number
      t.integer :user_id
      t.integer :library_id
      t.timestamps
    end
  end
end
