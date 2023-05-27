class CreateUsersLibrariesView < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      CREATE VIEW users_libraries AS
        SELECT users.name, libraries.name
        FROM users
        JOIN library_cards ON users.id = library_cards.user_id
        JOIN libraries ON libraries.id = library_cards.library_id
        GROUP BY users.name
        ORDER BY users.name ASC;
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW users_libraries;
    SQL
  end
end

    