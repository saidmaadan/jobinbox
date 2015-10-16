class AddEmployerIdToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :employer_id, :integer
  end
end
