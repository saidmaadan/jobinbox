class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :company
      t.string :position
      t.string :start_month
      t.string :start_year
      t.string :end_month
      t.string :end_year
      t.string :status
      t.text :description
      t.references :candidate, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
