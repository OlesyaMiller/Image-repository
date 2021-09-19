class User < ApplicationRecord
    has_many :images
    has_many :comments
end
