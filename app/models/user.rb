class User < ActiveRecord::Base
  acts_as_voter
	validates :email,
	presence: true,												#must exist
	uniqueness: {case_sensitive: false},	#option added
	email: true													#got from email_validator gem

	validates :password,
	presence: true,
	on: :create

	validates :name,
	presence: true,
	length: {maximum: 20},
	uniqueness: {case_sensitive: false}

	has_secure_password

  def self.authenticate(email, password)
    User.find_by_email(email).try(:authenticate, password)
  end

  def set_password_reset
    # this will ensure users with duplicate codes
    self.reset_code = loop do 
      code = SecureRandom.urlsafe_base64
      break code unless User.exists?(reset_code: code)
    end
    # set the expiration date with some handy date methods
    self.expires_at = 4.hours.from_now
    self.save!
  end

  has_many :solution
  has_many :rating
  has_many :comment

end
