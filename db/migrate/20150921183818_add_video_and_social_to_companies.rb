class AddVideoAndSocialToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :video, :string
    add_column :companies, :instagram, :string
    add_column :companies, :googleplus, :string
    add_column :companies, :pinterest, :string
    add_column :companies, :github, :string
  end
end
