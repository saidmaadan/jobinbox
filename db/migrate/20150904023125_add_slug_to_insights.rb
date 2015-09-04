class AddSlugToInsights < ActiveRecord::Migration
  def change
    add_column :insights, :slug, :string
    add_index :insights, :slug, unique: true
  end
end
