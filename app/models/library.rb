class Library < ApplicationRecord
  has_many :books
  has_many :library_cards
  validates :name, presence: true, uniqueness: true
  validates :year_of_creation, presence: true

  def self.add_library(name, year_of_creation)
    create_updated = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    library = Library.new(name:, year_of_creation:)
    if library.valid?
      connection.execute("INSERT INTO libraries (name, year_of_creation, created_at, updated_at) VALUES ('#{name}', '#{year_of_creation}' '#{create_updated}','#{create_updated}')")
      Library.last
    else
      puts library.errors.full_messages
      nil
    end
  end

  def self.update_library(name, year_of_creation, id)
    updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    library = Library.new(name:, year_of_creation:)
    if library.valid?
      connection.execute("UPDATE libraries SET name = '#{name}', year_of_creation = '#{year_of_creation}' updated_at = '#{updated_at}' WHERE id = #{id}")
      Library.find(id)
    else
      puts library.errors.full_messages
      nil
    end
  end

  def self.delete_library(id)
    library = Library.find(id)
    library.delete
  end
end
