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
				@status = Status.new
				@statuses = Status.where(user_id: @user.id)
				render "home/new", collection: @status, :notice => "Hello"
			end 
	end
end
