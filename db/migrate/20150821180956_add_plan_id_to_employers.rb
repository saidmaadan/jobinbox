class AddPlanIdToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :plan_id, :integer
  end
end
