class Item < ApplicationRecord
    has_one :itemimage
    belongs_to :category 
    has_many :cart
end
