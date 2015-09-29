class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true,
                  format: /\A\S+@\S+\z/
  validates :messages, length: { minimum: 20 }
end
