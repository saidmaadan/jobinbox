class AddLocationAndZipCodeToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :location, :string
    add_column :employers, :zip_code, :string
  end
end
