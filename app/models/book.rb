class Book < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :ordered_reviews, -> {order_by_rating}, class_name: 'Rating'

    validates :title, presence: true, uniqueness: { scope: :author }

    scope :order_by_rating, -> {order(:rating)}

    #def duplicate
   #     if Book.find_by(title: title, author: author)
    #        errors.add(:title, "This book has already been entered into our database!"
     #   end
    #end

    
end
