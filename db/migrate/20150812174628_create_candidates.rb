class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :username
      t.string :email_address
      t.string :password_digest
      t.string :phone
      t.text :about
      t.string :headline
      t.string :experience
      t.string :education
      t.string :desired_salary
      t.string :city
      t.string :zip_code
      t.string :country
      t.string :linkedin_url
      t.string :twitter_url
      t.string :github_url
      t.string :dribbble_url
      t.string :facebook_url
      t.string :auth_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.string :skype_id
      t.string :availability
      t.string :skills
      t.string :job_type
      t.string :languages
      t.string :how_heard
      t.string :image_url
      t.string :provider
      t.string :uid
      


      t.timestamps null: false
    end
  end
end
