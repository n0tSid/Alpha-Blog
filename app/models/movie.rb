class Movie < ApplicationRecord
  belongs_to :user
  has_many :movie_categories
  has_many :categories, through: :movie_categories

  validates :name, presence: true, length: {minimum: 3, maximum: 255}
  validates :description, presence: true
end