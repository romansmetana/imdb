# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) { create(:rating, :valid_rating) }

  describe "#rating validation passed" do
    it 'rating will be valid' do
      expect(rating).to be_valid
    end
  end

  describe "#rating validation failed" do
    it 'rating must be a integer only' do
      rating = build(:rating, :not_integer)
      expect(rating).to_not be_valid
    end
    
    it 'rating must be in the range from 1 to 10' do
      rating = build(:rating, :rating_in)
      expect(rating).to_not be_valid
    end
  end
end
