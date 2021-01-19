class AddCategoryIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :categories, index: true 
  end
end
