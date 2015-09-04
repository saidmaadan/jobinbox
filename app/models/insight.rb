class Insight < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_insights, use: :slugged
  searchkick
  
  def slug_insights
    [
      :title,
      [:title, :source_url]
    ]
  end
end
