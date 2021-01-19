class AddTypeIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :types, index: true 

  end
end
