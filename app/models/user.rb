class User < ActiveRecord::Base
	attr_accessor :password
	validates_confirmation_of :password
	before_save :encrypt_password

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)

	end	


	def self.authenticate(email,password)
		user = User.where(email: email).first
		# if the user exists, and the hashed password matches what is stored in the database, return the user's object (which contains their email and password) 
		if user && user.password_hash == BCrypt::Engine.hash-secret(password,user.password_salt)
		user
		# or bring back 'nil', which means that the existing user and the hashed password don't match
		else
			nil
		end
	end
end