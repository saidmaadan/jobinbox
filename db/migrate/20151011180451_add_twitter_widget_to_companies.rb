class AddTwitterWidgetToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :twitter_widget, :text
  end
end
