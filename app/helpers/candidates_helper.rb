module CandidatesHelper
	def profile_image_for(candidate, options={})
    size = options[:size] || 80
    url = "https://secure.gravatar.com/avatar/#{candidate.gravatar_id}?s=#{size}"
    image_tag(url, alt: candidate.name)
  end
end
