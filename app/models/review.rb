class Review < ApplicationRecord
    belongs_to :user
    belongs_to :book
    validates :content, :rating, presence: true
    validates_associated :book
    #accepts_nested_attributes_for :book

    def book_attributes=(attributes)
        book = Book.find_or_create_by(attributes)
        self.book = book if book.valid? || !self.book
     end

    scope :order_by_rating, -> {order(rating: :desc)}

    scope :search_by_rating, -> (search_rating){where("rating > ?", search_rating)}

    def self.average_rating
        average(:rating)
    end

    
end
