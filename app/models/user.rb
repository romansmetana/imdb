# frozen_string_literal: true

class User < ApplicationRecord
  has_many :ratings, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, presence: true
  validates :nickname, :email, uniqueness: true
  validates :nickname, length: { minimum: 3 }
end
