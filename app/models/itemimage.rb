class Itemimage < ApplicationRecord
    belongs_to :item
    has_one_attached :avatar

end
