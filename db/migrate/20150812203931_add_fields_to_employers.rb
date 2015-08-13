class AddFieldsToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :headlines, :text
    add_column :employers, :company_description, :text
    add_column :employers, :industry, :string
    add_column :employers, :company_size, :string
    add_column :employers, :logo, :string
    add_column :employers, :linkedin, :string
    add_column :employers, :facebook, :string
    add_column :employers, :twitter, :string
    add_column :employers, :instagram, :string
    add_column :employers, :phone_number, :string
    add_column :employers, :skype_id, :string
  end
end
