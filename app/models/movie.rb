# frozen_string_literal: true

class Movie < ApplicationRecord
  enum :category,
       { 'No category': 0, Action: 1, Comedy: 2, Drama: 3, Fantasy: 4, Horror: 5, Mystery: 6, Romance: 7, Thriller: 8,
         Westerm: 9 }
         
  validates :title, :description, :category, presence: true
  validates :ratings, numericality: { only_integer: true, in: 1..10 }
end
