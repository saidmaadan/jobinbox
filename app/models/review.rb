class Review < ActiveRecord::Base
  belongs_to :company
  belongs_to :candidate
  belongs_to :employer
  self.per_page = 5
  validates :rating, :pros, :cons, :advice, presence: true
  validates :rating, numericality:{ 
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    message: "Accept only a whole number between 1 and 5"
  }
end
