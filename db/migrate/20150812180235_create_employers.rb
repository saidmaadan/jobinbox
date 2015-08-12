class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :company_name
      t.string :name
      t.string :email_address
      t.string :website_url
      t.string :password_digest
      t.string :username
      t.string :avatar

      t.timestamps null: false
    end
  end
end
