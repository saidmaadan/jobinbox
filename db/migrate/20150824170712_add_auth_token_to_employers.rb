class AddAuthTokenToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :auth_token, :string
  end
end
