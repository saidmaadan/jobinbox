Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

	provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'],
  					scope: 'r_basicprofile', fields: ['id', 'first-name', 'last-name', 'email-address', 'headline', 'location', 'picture-url', 'public-profile-url']
  
end
