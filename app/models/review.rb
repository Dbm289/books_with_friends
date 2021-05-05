class Review < ApplicationRecord
    belongs_to :user
    belongs_to :book
    validates :book_id, presence: true
    validates_associated :book

    scope :order_by_rating, -> {order(:rating)}

    scope :search_by_rating, -> (search_rating){where("rating > ?", search_rating)}
end
