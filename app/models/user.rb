class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :password, length: { minimum: 8, maximum: 32 }
    
    has_secure_password
    
    has_many :topics
end
