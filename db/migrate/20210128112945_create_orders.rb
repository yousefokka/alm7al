class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :describtion
      t.decimal :total

      t.timestamps
    end
  end
end
