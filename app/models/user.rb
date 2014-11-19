class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 10, allow_blank: true }
  validates :name, presence: true
  validates :email, presence: true,
  					format: /\A\S+@\S+\z/,
  					uniqueness: { case_sensitive: false }
end
