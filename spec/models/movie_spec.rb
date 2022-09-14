# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { create(:movie, :valid_params) }

  describe '# movie validation' do
    it 'movie will be valid' do
      expect(movie).to be_valid
    end
  end
  
  describe '# movie validation failed' do
    let(:movie) { build(:movie, :invalid_params) }
    it 'movie title will be valid' do
      expect(movie).not_to be_valid
    end
  end
end
