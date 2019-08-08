class Answer < ApplicationRecord

    has_many :searches
    has_many :users, through: :searches

    # answer model will contain logic for handling returned content from SO API
end
