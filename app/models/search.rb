class Search < ApplicationRecord

    belongs_to :user
    belongs_to :answer
    
    validates :tags, presence: true

end
