class User < ApplicationRecord
    has_secure_password 

    has_many :searches
    has_many :answers, through: :searches

    validates :password, presence: true 
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true
end
