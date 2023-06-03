class Author < ApplicationRecord
  has_and_belongs_to_many :books
  validates :name, presence: true, uniqueness: true

  def self.add_author(name)
    create_updated = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    author = Author.new(name:)
    if author.valid?
      connection.execute("INSERT INTO authors (name, created_at, updated_at) VALUES ('#{name}', '#{create_updated}','#{create_updated}')")
      Author.last
    else
      puts author.errors.full_messages
      nil
    end
  end

  def self.update_author(name, id)
    updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    author = Author.new(name:)
    if author.valid?
      connection.execute("UPDATE authors SET name = '#{name}', updated_at = '#{updated_at}' WHERE id = #{id}")
      Author.find(id)
    else
      puts author.errors.full_messages
      nil
    end
  end

  def self.delete_author(id)
    author = Author.find(id)
    author.delete
  end
end
