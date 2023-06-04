require 'rails_helper'

RSpec.describe LibraryCardsController, type: :controller do
  let(:user_id) do
    User.create!(name: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Internet.password).id
  end
  let(:library_id) do
    Library.create!(name: Faker::Lorem.word, year_of_creation: Faker::Date.between(from: '1700-01-01', to: '2023-04-27')).id
  end
  let(:valid_attributes) do
    { user_id: user_id, library_id: library_id }
  end

  let(:invalid_attributes) do
    { user_id: nil, library_id: nil }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      LibraryCard.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      library_card = LibraryCard.create! valid_attributes
      get :show, params: { id: library_card.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      library_card = LibraryCard.create! valid_attributes
      get :edit, params: { id: library_card.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new LibraryCard' do
        expect do
          post :create, params: { library_card: valid_attributes }, session: valid_session
        end.to change(LibraryCard, :count).by(1)
      end

      it 'redirects to the created library_card' do
        post :create, params: { library_card: valid_attributes }, session: valid_session
        expect(response).to redirect_to(LibraryCard.last)
      end
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) do
      { user_id: user_id, library_id: library_id }
    end

    context 'with valid params' do
      it 'updates the requested library_card' do
        library_card = LibraryCard.create! valid_attributes
        put :update, params: { id: library_card.to_param, library_card: new_attributes }, session: valid_session
        library_card.reload
        expect(library_card.user_id).to eq(new_attributes[:user_id])
        expect(library_card.library_id).to eq(new_attributes[:library_id])
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested library_card' do
      library_card = LibraryCard.create! valid_attributes
      expect do
        delete :destroy, params: { id: library_card.to_param }, session: valid_session
      end.to change(LibraryCard, :count).by(-1)
    end
    it 'redirects to the library_cards list' do
      library_card = LibraryCard.create! valid_attributes
      delete :destroy, params: { id: library_card.to_param }, session: valid_session
      expect(response).to redirect_to(library_cards_url)
    end
  end
end
