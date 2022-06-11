class Album < ApplicationRecord
    has_many :album_users
    has_many :users, through: :album_user

    has_many_attached :images do |attachable|
        attachable.variant :thumb, resize: "100x100"
    end
     
end
