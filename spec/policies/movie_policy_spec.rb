# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviePolicy, type: :policy do
  subject { described_class }

  let(:admin) { create(:user, :admin) }
  let(:user) { create(:user) }

  permissions :create? do
    include_examples "Admin or User can/can't to do"
  end

  permissions :update? do
    include_examples "Admin or User can/can't to do"
  end

  permissions :destroy? do
    include_examples "Admin or User can/can't to do"
  end
end
