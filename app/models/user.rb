class User < ApplicationRecord
    has_many :albums
    has_many_attached :images do |attachable|
        attachable.variant :thumb, resize: "100x100"
    end
    
    has_secure_password
    validates :username, :email, :password_digest, presence: true, uniqueness: true
end
