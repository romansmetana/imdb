# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:user) { create(:user, :admin) }
  let(:movie) { create(:movie, :valid_params) }

  before { sign_in(user) }

  describe 'GET /index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns movies by category' do
      get :index, params: { category: 'Actions' }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get :show, params: { id: movie.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let(:valid_params) do
      { movie: { title: 'Tester', description: 'The best movie!',
                 category: 'Fantasy' } }
    end
    let(:invalid_params) do
      { movie: { title: nil, description: nil,
                 category: 'Fantasy' } }
    end

    it 'creation was successful' do
      post :create, params: valid_params
      expect(response).to redirect_to(root_path)
    end

    it 'creation was unsuccessful' do
      post :create, params: invalid_params
      expect(response).to redirect_to(new_movie_path)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get :edit, params: { id: movie.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    let(:params) { { movie: { title: 'Home alone' }, id: movie.id } }
    let(:invalid_params) { { movie: { title: nil }, id: movie.id } }

    it 'updated success' do
      put :update, params: params

      expect(movie.reload.title).to eq('Home alone')
      expect(response).to redirect_to(root_path)
    end

    it 'updated unsuccess' do
      put :update, params: invalid_params
      expect(movie.reload.title).to eq(movie.title)
      expect(response).to redirect_to(edit_movie_path)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      delete :destroy, params: { id: movie.id }
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to root_path
    end

    it 'failed to delete' do
      delete :destroy, params: { id: 14_351 }

      expect(response).to redirect_to root_path
    end
  end
end
