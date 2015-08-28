class AddFieldsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :company_name, :string
    add_column :jobs, :industry, :string
    add_column :jobs, :logo, :string
    add_column :jobs, :company_size, :string
    add_column :jobs, :website_url, :string
    add_column :jobs, :company_description, :text
    add_column :jobs, :responsibility, :text
    add_column :jobs, :experience, :string
  end
end
