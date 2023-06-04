require 'rails_helper'

RSpec.describe LibraryCard, type: :model do
  let(:user) do
    User.create!(name: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Internet.password)
  end
  let(:library) do
    Library.create!(name: Faker::Lorem.word, year_of_creation: Faker::Date.between(from: '1700-01-01', to: '2023-04-27'))
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      library_card = LibraryCard.new(user:, library:)
      expect(library_card).to be_valid
    end

    it 'is not valid without an library' do
      library_card = LibraryCard.new(user:, library: nil)
      expect(library_card).not_to be_valid
    end

    it 'is not valid without an user' do
      library_card = LibraryCard.new(user: nil, library:)
      expect(library_card).not_to be_valid
    end

    it 'is not valid without an user, library' do
      library_card = LibraryCard.new(user: nil, library: nil)
      expect(library_card).not_to be_valid
    end

    it 'is not valid with a duplicate user and library' do
      LibraryCard.create(user:, library:)
      library_card = LibraryCard.new(user:, library:)
      expect(library_card).not_to be_valid
    end
  end

  describe '.add_library_card' do
    it 'creates a new library_card' do
      expect { LibraryCard.add_library_card(user.id, library.id) }.to change { LibraryCard.count }.by(1)
    end

    it 'returns the newly created library_card' do
      library_card = LibraryCard.add_library_card(user.id, library.id)
      expect(library_card.user.id).to eq(user.id)
      expect(library_card.library.id).to eq(library.id)
    end

    it 'is not valid with a duplicate user and library' do
      LibraryCard.add_library_card(user.id, library.id)
      library_card = LibraryCard.add_library_card(user.id, library.id)
      expect(library_card).to be_nil
    end
  end

  describe '.delete_library_card' do
    let!(:library_card) do
      library_card = LibraryCard.add_library_card(user.id, library.id)
    end

    it 'deletes the library_card with the given id' do
      LibraryCard.delete_library_card(library_card.id)
      expect(LibraryCard.find_by(id: library_card.id)).to be_nil
    end
  end
end
