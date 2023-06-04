require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:author_ids) do
    [Author.create!(name: Faker::Name.first_name).id]
  end
  let(:genre_ids) do
    [Genre.create!(name: Faker::Book.genre).id]
  end
  let(:library_id) do
    Library.create!(name: Faker::Lorem.word, year_of_creation: Faker::Date.between(from: '1700-01-01', to: '2023-04-27')).id
  end
  let(:valid_attributes) do
    {
      name: Faker::Lorem.word,
      year: Faker::Date.between(from: '1700-01-01', to: '2023-04-27'),
      author_ids: author_ids,
      genre_ids: genre_ids,
      library_id: library_id
    }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      book = Book.create!(valid_attributes)
      get :show, params: { id: book.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      book = Book.create!(valid_attributes)
      get :edit, params: { id: book.to_param }
      expect(response).to be_successful
    end
  end
end
