class Album < ApplicationRecord
    belongs_to :user

    has_many_attached :images do |attachable|
        attachable.variant :thumb, resize: "100x100"
    end
     
end
