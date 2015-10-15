class Candidate < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	mount_uploader :resume, ResumeUploader
	has_secure_password
  
  extend FriendlyId
  friendly_id :username, use: :slugged
  searchkick
  validates :password, length: { minimum: 8, allow_blank: true }

  validates :name, presence: true
  validates :email_address, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }

  validates :username, presence: true,
                     format: /\A[A-Z0-9]+\z/i,
                     uniqueness: { case_sensitive: false }
  
  has_many :works
  has_many :educations
  has_many :jobs

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
    Digest::MD5::hexdigest(email_address.downcase)
  end
 
  def self.authenticate(email_address_or_username, password)
    candidate = Candidate.find_by(email_address: email_address_or_username) || Candidate.find_by(username: email_address_or_username)
    candidate && candidate.authenticate(password)
  end

  def should_generate_new_friendly_id?
    	new_record?
  end

  # class << self
  #   def from_omniauth(auth_hash)
  #     candidate = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
  #     # candidate = find_or_create_by(id: auth_hash['id']
  #     candidate.name = auth_hash['info']['name.parameterize']
  #     candidate.email_address = auth_hash['info']['email_address']
  #     candidate.username = auth_hash['info']['nickname']
  #     candidate.headline = auth_hash['info']['headline']
  #     candidate.city = get_social_location_for candidate.provider, auth_hash['info']['location']
  #     candidate.image_url = auth_hash['info']['image']
  #     candidate.linkedin_url = get_social_url_for candidate.provider, auth_hash['info']['urls']
  #     # candidate.save!
  #     candidate
  #   end

  #   private

  #   def get_social_location_for(provider, location_hash)
  #     case provider
  #       when 'linkedin'
  #         location_hash['name']
  #       else
  #         location_hash
  #     end
  #   end

  #   def get_social_url_for(provider, urls_hash)
  #     case provider
  #       when 'linkedin'
  #         urls_hash['public_profile']
  #       else
  #         urls_hash[provider.capitalize]
  #     end
  #   end
  # end


end
