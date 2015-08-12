class AddAdminToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :admin, :boolean, default: false
  end
end
