require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      library = Library.new(name: Faker::Lorem.word, year_of_creation: Faker::Date.between(from: '1700-01-01', to: '2023-04-27'))
      expect(library).to be_valid
    end

    it 'is not valid without a name' do
      library = Library.new(year_of_creation: Faker::Date.between(from: '1700-01-01', to: '2023-04-27'))
      expect(library).not_to be_valid
    end

    it 'is not valid without a year_of_creation' do
      library = Library.new(name: Faker::Lorem.word)
      expect(library).not_to be_valid
    end

  end

  describe '.add_library' do
    it 'creates a new library' do
      expect do
        Library.add_library(Faker::Lorem.word, Faker::Date.between(from: '1700-01-01', to: '2023-04-27'))
      end.to change(Library, :count).by(1)
    end
  end

  describe '.update_library' do
    let!(:library) { Library.create(name: 'Main Library', year_of_creation: Faker::Date.between(from: '1700-01-01', to: '2023-04-27')) }

    it 'updates an existing library' do
      expect do
        Library.update_library('Central Library', Faker::Date.between(from: '1700-01-01', to: '2023-04-27'), library.id)
      end.to change { library.reload.name }.from('Main Library').to('Central Library')
    end
  end

  describe '.delete_library_id' do
    let!(:library) { Library.create(name: Faker::Lorem.word, year_of_creation: Faker::Date.between(from: '1700-01-01', to: '2023-04-27')) }

    it 'deletes a library' do
      expect do
        Library.delete_library(library.id)
      end.to change(Library, :count).by(-1)
    end
  end
end
