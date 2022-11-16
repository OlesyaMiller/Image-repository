class User < ApplicationRecord
    has_many :album_users
    has_many :albums, through: :album_users

    has_secure_password
    validates :username, :email, :password_digest, presence: true, uniqueness: true
end
