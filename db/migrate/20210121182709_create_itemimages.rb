class CreateItemimages < ActiveRecord::Migration[6.0]
  def change
    create_table :itemimages do |t|

      t.timestamps
    end
  end
end
