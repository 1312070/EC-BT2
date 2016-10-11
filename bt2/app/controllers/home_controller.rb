class HomeController < ApplicationController
	def index
		current_user = User.find(session[:user_id])
		
		#@users = User.find(:all, :conditions => ["user_id in (?)", current_user.all_statuses])
		@users = User.all
		@statuses = Status.all
		@comments = Comment.all
	end
	def show
		#@user = User.where(username: params[:username])
		@user = User.find(params[:id])
		@statuses = User.all

		@comments = Comment.where(status_id: status)
	end
	def create
		current_user = User.find(session[:user_id])
		#@user = User.where(username: params[:username])
		@user = User.find_by_username(params[:username])
		if current_user.is_friend? @user
			#current_user.remove_friend(@user)
			friendship = Friendship.where(user_id: current_user.id, friend_id: @user.id)
			if friendship
				friendship.destroy_all
			end
			render 'show', :notice => "You are no longer following @#{@user.username}"
		else
			#current_user.add_friend(@user)
			@friendship = current_user.friendships.build(:friend_id => @user.id)
			@friendship.save!
			render 'show', :notice => "You are now following @#{@user.username}"
		end

	end 
end

