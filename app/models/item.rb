class Item < ApplicationRecord
    has_one :itemimage
    belongs_to :category
    belongs_to :cart
end
