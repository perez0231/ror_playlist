class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :fname, :lname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, :password_confirmation, presence: true, length: {minimum: 8}, :on => :create

  before_save :email_lowercase



  def email_lowercase
  email.downcase!
  end

end
