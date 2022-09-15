# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatingsController, type: :controller do
  let(:user) { create(:user, :admin) }
  let(:movie) { create(:movie, :valid_params) }

  before { sign_in(user) }

  describe 'POST /create' do
    let(:params) do
      { rating: 10, movie_id: movie.id,
        user_id: user.id }
    end

    it 'creation was successful' do
      post :create, params: params
      expect(response).to have_http_status(:success)
    end

    it 'creation was unsuccessful' do
      post :create, params: { rating: 24, movie_id: nil, user_id: nil }
      expect(response).to have_http_status(:success)
    end
  end
end
