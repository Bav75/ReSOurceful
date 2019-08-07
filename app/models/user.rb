class User < ApplicationRecord
    has_secure_password 

    has_many :searches
    has_many :answers, through: :searches
end
