class User < ApplicationRecord
	email_format = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	#validation:
	validates :username, :password, :email, :presence => true
	validates :username, :length => {:minimum => 3}
	validates :username, :uniqueness => {:message => "username already taken"}
	validates :password, :length => {:minimum => 5}
	validates :email, :uniqueness => {:message => "email already taken"}
end
