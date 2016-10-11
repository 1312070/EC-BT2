class StatusesController < ApplicationController
	def index
		
	end

	def show
		@status = Status.find(prarams[:id])
	end

	def new 
		@status = Status.new
	end

	def status_params
		allow = [:userid, :content]
		params.require(:status).permit(allow)
	end
	def create
		#@status = Status.new(status_params)
		current_user = User.find(session[:user_id])
		@status = current_user.statuses.build(status_params)
		@status.content = @status.content[0..140]
		#@statuses = Status.where(user_id: session[:user_id])
		if @status.save
			flash[:notice] = 'Your status was saved.'
			render 'home/new',collection: @statuses,:notice => ""
		else
			flash[:notice] = 'Unable to save'
			render 'home/new',collection: @statuses,:notice => ""
		end
	end
end
