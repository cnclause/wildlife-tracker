class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    # validates :password_digest, presence: true
    
    has_many :user_animals
    has_many :animals, through: :user_animals
end
