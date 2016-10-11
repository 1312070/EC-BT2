class HomeController < ApplicationController
	def index
		current_user = User.find(session[:user_id])
		
		#@users = User.find(:all, :conditions => ["user_id in (?)", current_user.all_statuses])
		@users = User.all
		@statuses = Status.all
		@comments = Comment.all
	end
end
