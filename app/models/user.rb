class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	accepts_nested_attributes_for :posts
	accepts_nested_attributes_for :comments
	
	before_create { generate_token(:auth_token) }
	before_save { self.email = email.downcase }
	has_secure_password validations: false
	# has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 #  	validates_attachment :avatar,
 #  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
	after_validation { self.errors.messages.delete(:avatar) }
    has_attached_file :avatar,
    :default_url => 'missing.png',
    :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    {:bucket => ENV["AWS_BUCKET_GUILD_SITE"], :access_key_id => ENV["AWS_ACCESS_KEY_GUILD_SITE"], :secret_access_key => ENV["AWS_SECURITY_KEY_GUILD_SITE"] }
  end

    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
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
