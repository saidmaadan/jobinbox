class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :skills
      t.text :description
      t.string :email
      t.string :url
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :position_type
      t.string :pay_rate
      t.string :job_length
      t.string :travel_required
      t.integer :employer_id
      t.integer :candidate_id
      t.string :slug

      t.timestamps null: false
    end
    add_index :jobs, :slug, unique: true
  end
end
