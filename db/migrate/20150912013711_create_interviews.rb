class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.string :job_title
      t.text :process
      t.text :questions
      t.text :anwsers
      t.string :interview_difficulty
      t.string :hired
      t.string :how_heard
      t.string :duration
      t.string :when
      t.string :where
      t.string :how_helpful
      t.integer :candidate_id
      t.integer :employer_id
      t.references :company, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
