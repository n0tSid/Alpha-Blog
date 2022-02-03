class Category < ApplicationRecord
  has_many :movie_categories
  has_many :movies, through: :movie_categories

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25}
  # validates_uniqueness_of :name
end