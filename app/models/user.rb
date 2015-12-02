class User < ActiveRecord::Base
	before_create { generate_token(:auth_token) }
	before_save { self.email = email.downcase }
	has_secure_password validations: false
	validates :username, uniqueness: { case_sensitive: false }, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, length: { maximum: 255 },
	                format: { with: VALID_EMAIL_REGEX },
	                uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }




# validates :encrypted_password, presence: {message: ' can''t be Blank!'}, length: {maximum: 50 , message: 'Exceeds Maximum number of Characters.'}


	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!(validate: false)
	  UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end

end
