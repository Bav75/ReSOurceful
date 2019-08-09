class Search < ApplicationRecord

    belongs_to :user
    belongs_to :answer
    
    validates :tags, presence: true

    # finds existing searches for a given user and answer
    def self.find_duplicates(answer, user)
        self.where(user: user, answer: answer)
    end

    

end
