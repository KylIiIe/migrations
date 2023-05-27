require 'faker'
require 'set'

def add_libraries(library_class)
  100.times do |i|
    name = "#{Faker::Lorem.word} #{i}"
    library_class.add_library(name)
  end
end

def add_authors(author_class)
  100.times do |i|
    name = "#{Faker::Name.first_name} #{i}"
    author_class.add_author(name)
  end
end

def add_genres(genre_class)
  100.times do |i|
    name = "#{Faker::Book.genre} #{i}"
    genre_class.add_genre(name)
  end
end

def add_books(book_class)
  100.times do |i|
    name = "#{Faker::Book.title} #{i}"
    year = Faker::Date.between(from: '1700-01-01', to: '2023-04-27')
    library_id = rand(1..100)
    genre_ids = Set.new
    rand(1..3).times { genre_ids.add(rand(1..100)) }
    author_ids = Set.new
    rand(1..3).times { author_ids.add(rand(1..100)) }
    book_class.add_book(name, year, library_id, author_ids.to_a, genre_ids.to_a)
  end
end

def add_users(user_class)
  100.times do |i|
    name = "#{Faker::Name.first_name} #{i}"
    user_class.add_user(name)
  end
end

def add_library_cards(library_card_class)
  100.times do |i|
    library_id = rand(1..100)
    user_id = i + 1
    library_card_class.add_library_card(user_id, library_id)
  end
end

# Щоб викликати функцію, потрібно передати класи: add_100_rows(Library, Author, Genre, Book, User, LibraryCard)
def add_100_rows(library_class, author_class, genre_class, book_class, user_class, library_card_class)
  add_libraries(library_class)
  add_authors(author_class)
  add_genres(genre_class)
  add_books(book_class)
  add_users(user_class)
  add_library_cards(library_card_class)
end
