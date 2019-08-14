class Answer < ApplicationRecord

    has_many :searches, dependent: :destroy
    has_many :users, through: :searches

    def self.find_user_answers(searches)
        self.where(searches: searches)
    end

end
