class Candidate < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	mount_uploader :resume, ResumeUploader
	has_secure_password
  
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :password, length: { minimum: 8, allow_blank: true }

  validates :name, presence: true
  validates :email, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }

  validates :username, presence: true,
                     format: /\A[A-Z0-9]+\z/i,
                     uniqueness: { case_sensitive: false }

  before_create {generate_token(:auth_token)}

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    CandidateMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Candidate.exists?(column => self[column])
  end

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end


  def self.authenticate(email_or_username, password)
    candidate = Candidate.find_by(email: email_or_username) || Candidate.find_by(username: email_or_username)
    candidate && candidate.authenticate(password)
  end

  def should_generate_new_friendly_id?
    	new_record?
  	end

end
