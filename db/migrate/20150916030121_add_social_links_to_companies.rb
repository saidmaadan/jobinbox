class AddSocialLinksToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :facebook, :string
    add_column :companies, :twitter, :string
    add_column :companies, :youtube, :string
    add_column :companies, :linkedin, :string
  end
end
