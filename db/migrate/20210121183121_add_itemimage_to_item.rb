class AddItemimageToItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :itemimages , :item, index: true 
  end
end
