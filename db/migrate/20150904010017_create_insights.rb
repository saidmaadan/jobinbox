class CreateInsights < ActiveRecord::Migration
  def change
    create_table :insights do |t|
      t.string :title
      t.text :content
      t.string :source_url
      t.integer :employer_id
      t.string :logo

      t.timestamps null: false
    end
  end
end
