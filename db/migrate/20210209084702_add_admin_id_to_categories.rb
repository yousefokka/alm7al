class AddAdminIdToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories , :admin, index: true 

  end
end
