class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :company_name
      t.integer :rating
      t.string :employee_status
      t.string :employee_type
      t.string :title
      t.text :pros
      t.text :cons
      t.text :advice
      t.references :company, index: true
      t.references :employer, index: true
      t.references :candidate, index: true

      t.timestamps null: false
    end
  end
end
