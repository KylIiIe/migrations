class Book < ApplicationRecord
  belongs_to :library
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :library_cards, optional: true
  validates :name, presence: true
  validates :year, presence: true
  validates :library, presence: true
  validates :genres, presence: true
  validates :library_cards, presence: false
  validates :authors, presence: true


  def self.add_book(name, year, library_id, author_ids, genre_ids)
    genres = Genre.find(genre_ids)
    library = Library.find(library_id)
    authors = Author.find(author_ids)
    book = Book.new(name:, year:, library:, genres:, authors:)
    if book.valid?
      book.save
      Book.last
    else
      puts book.errors.full_messages
      nil
    end
  end

  def self.update_book(name, year, library_id, author_ids, genre_ids, id)
    library = Library.find(library_id)
    authors = Author.find(author_ids)
    genres = Genre.find(genre_ids)
    book_id = Book.find(id)
    book = Book.new(name:, year:, library:, genres:, authors:)
    if book.valid?
      book_id.update(name:, year:, library:, genres:, authors:)
      Book.find(id)
    else
      puts book.errors.full_messages
      nil
    end
  end

  def self.delete_book(id)
    book = Book.find(id)
    book.authors = []
    book.genres = []
    book.library_cards = []
    book.delete
  end
end
