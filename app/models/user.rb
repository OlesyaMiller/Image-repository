class User < ApplicationRecord
    has_many_attached :images
    has_many :comments
end
