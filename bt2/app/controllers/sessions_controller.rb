class SessionsController < ApplicationController
	def index
	end

	def new
		@user = User.new
	end

	def create
		@user = User.authenticate(params[:username], params[ :password])
			if @user.nil?
				redirect_to new_session_path, :notice => "Invalid username or password"
			else
				session[:user_id] = @user.id
				redirect_to new_session_path, :notice => "Hello!"
			end 
	end
end
