class AddFavoriteWebsiteToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :favorite_website, :string
  end
end
