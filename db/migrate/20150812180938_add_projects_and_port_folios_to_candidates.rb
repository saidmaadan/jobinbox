class AddProjectsAndPortFoliosToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :projects_link, :string
    add_column :candidates, :portfolio_url, :string
  end
end
