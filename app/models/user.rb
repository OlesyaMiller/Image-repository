class User < ApplicationRecord
    has_many :albums
    
    has_secure_password
    validates :username, :email, :password_digest, presence: true, uniqueness: true
end
