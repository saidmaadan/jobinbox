class AddStripeCustomerTokenToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :stripe_customer_token, :string
  end
end
