class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :books, through: :reviews

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    #valdiates :is_email?

    def is_email?
        if !email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
            errors.add(:email, "Give me a real email dammit")
        end 
        
    end 
end
