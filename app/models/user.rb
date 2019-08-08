class User < ApplicationRecord
    has_secure_password 

    has_many :searches
    has_many :answers, through: :searches

    validates :password, presence: true 
    # validates :name, presence: true 
    validates :username, presence: true, uniqueness: true
    

    def self.find_or_create_from_oauth(auth_hash)
        user = self.find_by(username: auth_hash['info']['nickname'])

        if user.nil?
            user = User.create(username: auth_hash['info']['nickname'], password: SecureRandom.hex)
            return user 
        else
            return user 
        end
        
    end
    

end
