require 'rails_helper'

RSpec.describe Author, type: :model do
  describe '#add_author' do
    context 'when valid parameters are provided' do
      it 'should create a new author' do
        expect do
          Author.add_author(Faker::Name.first_name)
        end.to change { Author.count }.by(1)
      end
    end

    context 'when invalid parameters are provided' do
      it 'should not create a new author and return nil' do
        expect do
          Author.add_author(nil)
        end.to_not change { Author.count }

        expect(Author.add_author(nil)).to be_nil
      end
    end
  end

  describe '#update_author' do
    let!(:author) { Author.create(name: Faker::Name.first_name) }

    context 'when valid parameters are provided' do
      it 'should update an existing author' do
        updated_author = Author.update_author('New Name', author.id)
        expect(updated_author).to be_a(Author)
        expect(updated_author.name).to eq('New Name')
      end
    end
  end

  describe '#delete_author' do
    let!(:author) { Author.create(name: Faker::Name.first_name) }

    it 'should delete an existing author' do
      expect do
        Author.delete_author(author.id)
      end.to change { Author.count }.by(-1)
    end
  end
end
