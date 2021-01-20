class AddUserIdToCategory < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories , :user, index: true 

  end
end
