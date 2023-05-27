class Genre < ApplicationRecord
  has_and_belongs_to_many :books
  validates :name, presence: true, uniqueness: true

  def self.add_genre(name)
    genre = Genre.new(name:)
    if genre.valid?
      connection.execute("INSERT INTO genres (name) VALUES ('#{name}')")
      Genre.last
    else
      puts genre.errors.full_messages
      nil
    end
  end

  def self.update_genre(name, id)
    genre = Genre.new(name:)
    if genre.valid?
      connection.execute("UPDATE genres SET name = '#{name}' WHERE id = #{id}")
      Genre.find(id)
    else
      puts genre.errors.full_messages
      nil
    end
  end
end
