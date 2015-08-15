module EmployersHelper
	def profile_image_for(employer, options={})
    size = options[:size] || 80
    url = "https://secure.gravatar.com/avatar/#{employer.gravatar_id}?s=#{size}"
    image_tag(url, alt: employer.name)
  end
end
