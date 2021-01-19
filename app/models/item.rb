class Item < ApplicationRecord
    belongs_to :category
    belongs_to :type
    has_one_attached :image
end
