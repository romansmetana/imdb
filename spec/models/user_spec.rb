# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#user validation' do
    let(:user) { create(:user) }

    it "is valid with valid user" do
      expect(user).to be_valid
    end

    it "is not valid without a nickname" do
      user.nickname = nil

      expect(user).not_to be_valid
    end
    it "is not valid without a email" do
      user.nickname = nil

      expect(user).not_to be_valid
    end
  end
end
