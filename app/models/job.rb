class Job < ActiveRecord::Base
	belongs_to :employer

	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :skills],
      [:title, :skills, :email,],
      [:title, :skills, :email, :zip_code],
      [:title, :skills, :email, :zip_code, :city]
    ]
  end

  #  def has_friendly_id_slug?
  #   slugs.where(slug: slug).exists?
  # end

  # def should_generate_new_friendly_id?
  #   new_record?
  # end


end
