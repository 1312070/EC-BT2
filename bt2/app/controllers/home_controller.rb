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
end
