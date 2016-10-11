class User < ApplicationRecord

	include Gravtastic
  	gravtastic :size => 50
	#mount_uploader :avatar, ImageUploader
	before_create :default_name
	

	def default_name
		self.name ||= File.basename(avatar.filename, '.*').titleize if avatar
	end
	
	def is_friend?(friend)
		return self.friends.include? friend
	end


	email_format = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	#validation:
	validates :username, :password, :email, :presence => true
	validates :username, :length => {:minimum => 3}
	validates :username, :uniqueness => {:message => "username already taken"}
	validates :password, :length => {:minimum => 5}
	validates :email, :uniqueness => {:message => "email already taken"}

	def self.authenticate(username, pass)
		@user = find_by_username(username)
		
		return nil if @user.nil?
		return @user if @user.password == pass
	end

	has_many :statuses
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user

end
