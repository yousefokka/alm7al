class ChangePriceToBeDecimalInItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :price, :decimal, using: 'price::decimal'

  end
end
