class AddFieldsToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :avatar, :string
    add_column :candidates, :resume, :string
  end
end
