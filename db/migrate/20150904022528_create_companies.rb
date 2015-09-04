class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :about
      t.string :industry
      t.string :founded
      t.string :size
      t.string :subsidiaries
      t.string :location
      t.string :website
      t.string :logo
      t.string :avatar

      t.timestamps null: false
    end
  end
end
