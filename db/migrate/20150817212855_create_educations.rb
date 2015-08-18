class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school
      t.string :degree
      t.string :year
      t.references :candidate, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
