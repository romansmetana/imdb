# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe '#user validation passed' do
    it 'is valid user' do
      expect(user).to be_valid
    end
  end

  describe '#user validation failed' do
    let(:user) { build(:user) }

    it 'User is not valid without a nickname' do
      user.nickname = nil

      expect(user).not_to be_valid
    end

    it 'User is not valid without a email' do
      user.email = nil

      expect(user).not_to be_valid
    end
  end
end
