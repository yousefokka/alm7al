class AddUserIdToType < ActiveRecord::Migration[6.0]
  def change
    add_reference :types , :user, index: true 

  end
end
