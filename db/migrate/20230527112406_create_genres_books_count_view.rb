class CreateGenresBooksCountView < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE VIEW books_genres_count AS
        SELECT genres.id, genres.name, COUNT(*) as book_count
        FROM genres
        JOIN books_genres ON genres.id = books_genres.genre_id
        JOIN books ON books.id = books_genres.book_id
        GROUP BY genres.id
        ORDER BY genres.name ASC;
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW books_genres_count;
    SQL
  end
end
