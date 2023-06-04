require 'rails_helper'

RSpec.describe Book, type: :model do
  let!(:library) { Library.create!(name: Faker::Lorem.word, year_of_creation: Faker::Date.between(from: '1700-01-01', to: '2023-04-27')) }
  let(:author_ids) do
    [Author.create!(name: Faker::Name.first_name).id]
  end
  let(:genre_ids) do
    [Genre.create!(name: Faker::Book.genre).id]
  end

  describe '.add_book' do
    context 'when valid parameters are provided' do
      it 'creates a new book' do
        expect do
          Book.add_book('Test Book', Faker::Date.between(from: '1700-01-01', to: '2023-04-27'), library.id, author_ids, genre_ids)
        end.to change(Book, :count).by(1)
      end
    end

    context 'when invalid parameters are provided' do
      it 'returns nil' do
        book = Book.add_book('', Faker::Date.between(from: '1700-01-01', to: '2023-04-27'), library.id, author_ids, genre_ids)
        expect(book).to be_nil
      end
    end
  end

  describe '.update_book' do
    let!(:library) { Library.create!(name: Faker::Lorem.word, year_of_creation: Faker::Date.between(from: '1700-01-01', to: '2023-04-27')) }
    let!(:library_card) do
      user = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Internet.password)
      library_card = LibraryCard.add_library_card(user.id, library.id)
    end
    let!(:book) { book = Book.add_book('Test Book', Faker::Date.between(from: '1700-01-01', to: '2023-04-27'), library.id, author_ids, genre_ids) }

    context 'when valid parameters are provided' do
      it 'updates the existing book' do
        updated_book = Book.update_book('New Title', '2023-04-03', library.id, author_ids, genre_ids, book.id)
        expect(updated_book.name).to eq('New Title')
      end
    end

    context 'when invalid parameters are provided' do
      it 'returns nil' do
        updated_book = Book.update_book('', '2023-04-03', library.id, author_ids, genre_ids, book.id)
        expect(updated_book).to be_nil
      end
    end
  end

  describe '.delete_book' do
    let!(:library) { Library.create!(name: Faker::Lorem.word, year_of_creation: Faker::Date.between(from: '1700-01-01', to: '2023-04-27')) }
    let!(:library_card) do
      user = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Internet.password)
      library_card = LibraryCard.add_library_card(user.id, library.id)
    end
    let!(:book) { book = Book.add_book('Test Book', Faker::Date.between(from: '1700-01-01', to: '2023-04-27'), library.id, author_ids, genre_ids) }

    it 'deletes the book' do
      expect do
        Book.delete_book(book.id)
      end.to change(Book, :count).by(-1)
    end
  end
end
