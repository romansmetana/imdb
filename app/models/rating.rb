# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :rating, numericality: { only_integer: true, in: 1..10 }
end
