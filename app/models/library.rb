class Library < ApplicationRecord
  has_many :books
  has_many :library_cards
  validates :name, presence: true, uniqueness: true

  def self.add_library(name)
    create_updated = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    library = Library.new(name:)
    if library.valid?
      connection.execute("INSERT INTO libraries (name, created_at, updated_at) VALUES ('#{name}', '#{create_updated}','#{create_updated}')")
      Library.last
    else
      puts library.errors.full_messages
      nil
    end
  end

  def self.update_library(name, id)
    updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    library = Library.new(name:)
    if library.valid?
      connection.execute("UPDATE libraries SET name = '#{name}', updated_at = '#{updated_at}' WHERE id = #{id}")
      Library.find(id)
    else
      puts library.errors.full_messages
      nil
    end
  end
end
