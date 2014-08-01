class User < ActiveRecord::Base
	validates :username, presence: true
	validates :username, uniqueness: true
	before_save :encrypt_password


	def self.authenticate(username, password)
    	user = find_by_username(username)
    	if user && user.password == BCrypt::Engine.hash_secret(password, user.salt)
      		user
    	else
      		nil
    	end
  	end

	private
	def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end

end
