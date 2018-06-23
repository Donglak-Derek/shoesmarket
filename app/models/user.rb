class User < ActiveRecord::Base
  has_secure_password

  has_many :shoes, dependent: :destroy

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, :email, presence: true
end
