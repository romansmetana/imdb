# frozen_string_literal: true

class Movie < ApplicationRecord
  enum :category,
       { 'No category': 0, Action: 1, Comedy: 2, Drama: 3, Fantasy: 4, Horror: 5, Mystery: 6, Romance: 7, Thriller: 8,
         Westerm: 9 }
end
