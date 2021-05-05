class Book < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :ordered_reviews, -> {order_by_rating}, class_name: 'Rating'
end
