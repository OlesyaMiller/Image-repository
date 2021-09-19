class User < ApplicationRecord
    has_many_attached :images
    has_many :comments
    has_secure_password
    validates :username, :email, :password_digest, presence: true, uniqueness: true
end
