class Album < ApplicationRecord

    has_many_attached :images do |attachable|
        attachable.variant :thumb, resize: "100x100"
    end
    
    belongs_to :user 
end
