class User < ActiveRecord::Base
  has_secure_password
  
  validates :name, presence: true
  
  validates :email, presence: true,                   
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }
  
  validates :password, length: { minimum: 4, allow_blank: true }

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end
                      
  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end
end
