require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'validations' do
    it 'requires a name' do
      genre = Genre.new
      genre.valid?
      expect(genre.errors[:name]).to include("can't be blank")
    end

    it 'requires a unique name' do
      Genre.create(name: 'Fantasy')
      genre = Genre.new(name: 'Fantasy')
      genre.valid?
      expect(genre.errors[:name]).to include('has already been taken')
    end
  end

  describe '.add_genre' do
    it 'creates a new genre with valid attributes' do
      expect do
        Genre.add_genre(Faker::Book.genre)
      end.to change(Genre, :count).by(1)
    end

    it 'does not create a new genre with invalid attributes' do
      expect do
        Genre.add_genre(nil)
      end.not_to change(Genre, :count)
    end
  end

  describe '.update_genre' do
    let!(:genre) { Genre.create(name: 'Old Genre') }

    it 'updates an existing genre with valid attributes' do
      Genre.update_genre('New Genre', genre.id)
      expect(genre.reload.name).to eq('New Genre')
    end

    it 'does not update an existing genre with invalid attributes' do
      Genre.update_genre(nil, genre.id)
      expect(genre.reload.name).to eq('Old Genre')
    end
  end

  describe '.delete_genre' do
    let!(:genre) { Genre.create(name: Faker::Book.genre) }

    it 'deletes the specified genre' do
      expect do
        Genre.delete_genre(genre.id)
      end.to change(Genre, :count).by(-1)
    end
  end
end
