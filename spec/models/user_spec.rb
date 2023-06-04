require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Internet.password)
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'John Doe')
      expect(user).not_to be_valid
    end

    it 'is not valid without an email and name' do
      user = User.new
      expect(user).not_to be_valid
    end

    it 'is not valid without an name' do
      user = User.new(email: 'johndoe@example.com')
      expect(user).not_to be_valid
    end

    it 'is not valid with a duplicate email' do
      User.create(name: 'Jane Doe', email: 'johndoe@example.com')
      user = User.new(name: 'John Doe', email: 'johndoe@example.com')
      expect(user).not_to be_valid
    end
  end

  describe '.delete_user' do
    let!(:user) { User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Internet.password) }

    it 'deletes the user with the given id' do
      User.delete_user(user.id)
      expect(User.find_by(id: user.id)).to be_nil
    end
  end
end
