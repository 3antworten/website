class Contact < ActiveRecord::Base
  validates :from, presence: true
  validates :email, format: { with: /[^\s]+@[^\s]+\.[^\s]+/ }
  validates :message, presence: true
end
