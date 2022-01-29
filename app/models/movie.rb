class Movie < ApplicationRecord
    validates :name, presence: true, length: {minimum: 3, maximum: 255}
    validates :genre, presence: true, length: {minimum: 3}
    belongs_to :user
end