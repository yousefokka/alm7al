class AddAuthenticationTokenToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :auth_token, :string
  end
end
