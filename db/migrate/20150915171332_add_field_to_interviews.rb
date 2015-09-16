class AddFieldToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :duration_days, :string
    add_column :interviews, :when_month, :string
  end
end
