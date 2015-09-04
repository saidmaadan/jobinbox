class AddEmployerIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :employer_id, :integer
  end
end
